
# @knitr template_objects
# For package 'rpm'

# data

rmd.template <-
'\n
## Introduction
ADD_TEXT_HERE

### Motivation
ADD_TEXT_HERE

### Details
ADD_TEXT_HERE

#### Capabilities
ADD_TEXT_HERE

#### Limitations
ADD_TEXT_HERE

## Related items

### Files and Data
ADD_TEXT_HERE

### Code flow
ADD_TEXT_HERE

```{r code_sankey, echo=F, eval=T}
```

```{r code_sankey_embed, echo=F, eval=T, comment=NA, results="asis", tidy=F}
```

## R code

### Setup
ADD_TEXT_HERE: EXAMPLE
Setup consists of loading required **R** packages and additional files, preparing any command line arguments for use, and defining functions and other **R** objects.
\n'

# default path
matt.proj.path <- "C:/github"

# @knitr fun_newProject
newProject <- function(name, path,
	dirs=c("code", "data", "docs", "plots", "workspaces"),
	docs.dirs=c("diagrams", "ioslides", "notebook", "Rmd/include", "md", "html", "Rnw", "pdf", "timeline", "tufte"),
	overwrite=FALSE){
	
	stopifnot(is.character(name))
	name <- file.path(path, name)
	if(file.exists(name) && !overwrite) stop("This project already exists.")
	dir.create(name, recursive=TRUE, showWarnings=FALSE)
	if(!file.exists(name)) stop("Directory appears invalid.")
	
	path.dirs <- file.path(name, dirs)
	sapply(path.dirs, dir.create, showWarnings=FALSE)
	path.docs <- file.path(name, "docs", docs.dirs)
	if("docs" %in% dirs) sapply(path.docs, dir.create, recursive=TRUE, showWarnings=FALSE)
	if(overwrite) cat("Project directories updated.\n") else cat("Project directories created.\n")
}

# @knitr fun_rmdHeader
# Generate Rmd files
# Rmd yaml front-matter
# called by genRmd
.rmdHeader <- function(title="filenames", author="Matthew Leonawicz", theme="united", highlight="zenburn", toc=FALSE, keep.md=TRUE, ioslides=FALSE, include.pdf=FALSE){
	if(toc) toc <- "true" else toc <- "false"
	if(keep.md) keep.md <- "true" else keep.md <- "false"
	if(ioslides) hdoc <- "ioslides_presentation" else hdoc <- "html_document"
	rmd.header <- "---\n"
	if(!is.null(title)) rmd.header <- paste0(rmd.header, 'title: ', title, '\n')
	if(!is.null(author)) rmd.header <- paste0(rmd.header, 'author: ', author, '\n')
	rmd.header <- paste0(rmd.header, 'output:\n  ', hdoc, ':\n    toc: ', toc, '\n    theme: ', theme, '\n    highlight: ', highlight, '\n    keep_md: ', keep.md, '\n')
	if(ioslides) rmd.header <- paste0(rmd.header, '    widescreen: true\n')
	if(include.pdf) rmd.header <- paste0(rmd.header, '  pdf_document:\n    toc: ', toc, '\n    highlight: ', highlight, '\n')
	rmd.header <- paste0(rmd.header, '---\n')
	rmd.header
}

# @knitr fun_rmdknitrSetup
# Rmd knitr setup chunk
# called by genRmd
.rmdknitrSetup <- function(file, include.sankey=FALSE){
	x <- paste0('\n```{r knitr_setup, echo=FALSE}\nopts_chunk$set(cache=FALSE, eval=FALSE, tidy=TRUE, message=FALSE, warning=FALSE)\n')
	if(include.sankey) x <- paste0(x, 'read_chunk("../../code/proj_sankey.R")\n')
	x <- paste0(x, 'read_chunk("../../code/', gsub("\\.Rmd", "\\.R", basename(file)), '")\n```\n')
	x
}

# @knitr fun_genRmd
genRmd <- function(path, replace=FALSE,
	header.args=list(title="filename", author=NULL, theme="united", highlight="zenburn", toc=FALSE, keep.md=TRUE, ioslides=FALSE, include.pdf=FALSE),
	update.header=FALSE, ...){
	
	stopifnot(is.character(path))
	files <- list.files(path, pattern=".R$", full=TRUE)
	stopifnot(length(files) > 0)
	rmd <- gsub("\\.R", "\\.Rmd", basename(files))
	rmd <- file.path(dirname(path), "docs/Rmd", rmd)
	if(!(replace | update.header)) rmd <- rmd[!sapply(rmd, file.exists)]
	if(update.header) rmd <- rmd[sapply(rmd, file.exists)]
	stopifnot(length(rmd) > 0)
	
	sinkRmd <- function(x, arglist,  ...){
		if(arglist$title=="filename") arglist$title <- gsub("\\.Rmd", "\\.R", basename(x))
		y1 <- do.call(.rmdHeader, arglist)
		y2 <- .rmdknitrSetup(file=x, ...)
		y3 <- list(...)$rmd.template
		if(is.null(y3)) y3 <- rmd.template
		sink(x)
		sapply(c(y1, y2, y3), cat)
		sink()
	}
	
	swapHeader <- function(x, arglist){
		if(arglist$title=="filename") arglist$title <- gsub("\\.Rmd", "\\.R", basename(x))
		header <- do.call(.rmdHeader, arglist)
		l <- readLines(x)
		ind <- which(l=="---")
		l <- l[(ind[2] + 1):length(l)]
		l <- paste0(l, "\n")
		sink(x)
		sapply(c(header, l), cat)
		sink()
	}
	
	if(update.header){
		sapply(rmd, swapHeader, arglist=header.args)
		cat("yaml header updated for each .Rmd file.\n")
	} else {
		sapply(rmd, sinkRmd, arglist=header.args, ...)
		cat(".Rmd files created for each .R file.\n")
	}
}

# @knitr fun_chunkNames
chunkNames <- function(path, rChunkID="# @knitr", rmdChunkID="```{r", append.new=FALSE){
	files <- list.files(path, pattern=".R$", full=TRUE)
	stopifnot(length(files) > 0)
	l1 <- lapply(files, readLines)
	l1 <- rapply(l1, function(x) x[substr(x, 1, nchar(rChunkID))==rChunkID], how="replace")
	l1 <- rapply(l1, function(x, p) gsub(paste0(p, " "), "", x), how="replace", p=rChunkID)
	if(!append.new) return(l1)
	
	appendRmd <- function(x, rmd.files, rChunks, rmdChunks, ID){
		r1 <- rmdChunks[[x]]
		r2 <- rChunks[[x]]
		r.new <- r2[!(r2 %in% r1)]
		if(length(r.new)){
			r.new <- paste0(ID, " ", r.new, "}\n```\n", collapse="") # Hard coded brace and backticks
			sink(rmd.files[x], append=TRUE)
			cat("\nNEW_CODE_CHUNKS\n")
			cat(r.new)
			sink()
			paste(basename(rmd.files[x]), "appended with new chunk names from .R file")
		}
		else paste("No new chunk names appended to", basename(rmd.files[x]))
	}
	
	rmd <- gsub("\\.R", "\\.Rmd", basename(files))
	rmd <- file.path(dirname(path), "docs/Rmd", rmd)
	rmd <- rmd[sapply(rmd, file.exists)]
	stopifnot(length(rmd) > 0) # Rmd files must exist
	files.ind <- match(gsub("\\.Rmd", "", basename(rmd)), gsub("\\.R", "", basename(files))) # Rmd exist for which R script
	l2 <- lapply(rmd, readLines)
	l2 <- rapply(l2, function(x) x[substr(x, 1, nchar(rmdChunkID))==rmdChunkID], how="replace")
	l2 <- rapply(l2, function(x, p) gsub(paste0(p, " "), "", x), how="replace", p=gsub("\\{", "\\\\{", rmdChunkID))
	l2 <- rapply(l2, function(x) gsub("}", "", sapply(strsplit(x, ","), "[[", 1)), how="replace")
	sapply(1:length(rmd), appendRmd, rmd.files=rmd, rChunks=l1[files.ind], rmdChunks=l2, ID=rmdChunkID)
}

# @knitr fun_swapHeadings
# Rmd <-> Rnw document conversion
# Conversion support functions
# called by .swap()
.swapHeadings <- function(from, to, x){
	nc <- nchar(x)
	ind <- which(substr(x, 1, 1)=="\\")
	if(!length(ind)){ # assume Rmd file
		ind <- which(substr(x, 1, 1)=="#")
		ind.n <- rep(1, length(ind))
		for(i in 2:6){
			ind.tmp <- which(substr(x[ind], 1, i)==substr("######", 1, i))
			if(length(ind.tmp)) ind.n[ind.tmp] <- ind.n[ind.tmp] + 1 else break
		}
		for(i in 1:length(ind)){
			n <- ind.n[i]
			input <- paste0(substr("######", 1, n), " ")
			h <- x[ind[i]]
			h <- gsub("\\*", "_", h) # Switch any markdown boldface asterisks in headings to double underscores
			heading <- gsub("\n", "", substr(h, n+2, nc[ind[i]]))
			#h <- gsub(input, "", h)
			if(n <= 2) subs <- "\\" else if(n==3) subs <- "\\sub" else if(n==4) subs <- "\\subsub" else if(n >=5) subs <- "\\subsubsub"
			output <- paste0("\\", subs, "section{", heading, "}\n")
			x[ind[i]] <- gsub(h, output, h)
		}
	} else { # assume Rnw file
		ind <- which(substr(x, 1, 8)=="\\section")
		if(length(ind)){
			for(i in 1:length(ind)){
				h <- x[ind[i]]
				heading <- paste0("## ", substr(h, 10, nchar(h)-2), "\n")
				x[ind[i]] <- heading
			}
		}
		ind <- which(substr(x, 1, 4)=="\\sub")
		if(length(ind)){
			for(i in 1:length(ind)){
				h <- x[ind[i]]
				z <- substr(h, 2, 10)
				if(z=="subsubsub") {p <- "##### "; n <- 19 } else if(substr(z, 1, 6)=="subsub") { p <- "#### "; n <- 16 } else if(substr(z, 1, 3)=="sub") { p <- "### "; n <- 13 }
				heading <- paste0(p, substr(h, n, nchar(h)-2), "\n")
				x[ind[i]] <- heading
			}
		}
	}
	x
}

# @knitr fun_swapChunks
# Rmd <-> Rnw document conversion
# Conversion support functions
# called by .swap()
.swapChunks <- function(from, to, x, offset.end=1){
	gsbraces <- function(txt) gsub("\\{", "\\\\{", txt)
	nc <- nchar(x)
	chunk.start.open <- substr(x, 1, nchar(from[1]))==from[1]
	chunk.start.close <- substr(x, nc-offset.end-nchar(from[2])+1, nc - offset.end)==from[2]
	chunk.start <- which(chunk.start.open & chunk.start.close)
	chunk.end <- which(substr(x, 1, nchar(from[3]))==from[3] & nc==nchar(from[3]) + offset.end)
	x[chunk.start] <- gsub(from[2], to[2], gsub(gsbraces(from[1]), gsbraces(to[1]), x[chunk.start]))
	x[chunk.end] <- gsub(from[3], to[3], x[chunk.end])
	chunklines <- as.numeric(unlist(mapply(seq, chunk.start, chunk.end)))
	list(x, chunklines)
}

# @knitr fun_swapEmphasis
# Rmd <-> Rnw document conversion
# Conversion support functions
# called by .swap()
# I know I use '**' strictly for bold font in Rmd files.
# For now, this function assumes:
# 1. The only emphasis in a doc is boldface or typewriter.
# 2. These instances are always preceded by a space, a carriage return, or an open bracket,
# 3. and followed by a space, period, comma, or closing bracket.
.swapEmphasis <- function(x, emphasis="remove",
	pat.remove=c("`", "\\*\\*", "__"),
	pat.replace=pat.remove,
	replacement=c("\\\\texttt\\{", "\\\\textbf\\{", "\\\\textbf\\{", "\\}", "\\}", "\\}")){
	
	stopifnot(emphasis %in% c("remove", "replace"))
	n <- length(pat.replace)
	rep1 <- replacement[1:n]
	rep2 <- replacement[(n+1):(2*n)]
	prefix <- c(" ", "^", "\\{", "\\(")
	suffix <- c(" ", ",", "-", "\n", "\\.", "\\}", "\\)")
	n.p <- length(prefix)
	n.s <- length(suffix)
	pat.replace <- c(paste0(rep(prefix, n), rep(pat.replace, each=n.p)), paste0(rep(pat.replace, each=n.s), rep(suffix, n)))
	replacement <- c(paste0(rep(gsub("\\^", "", prefix), n), rep(rep1, each=n.p)), paste0(rep(rep2, each=n.s), rep(suffix, n)))
	if(emphasis=="remove") for(k in 1:length(pat.remove)) x <- sapply(x, function(v, p, r) gsub(p, r, v), p=pat.remove[k], r="")
	if(emphasis=="replace") for(k in 1:length(pat.replace)) x <- sapply(x, function(v, p, r) gsub(p, r, v), p=pat.replace[k], r=replacement[k])
	x
}

# @knitr fun_swap
# Rmd <-> Rnw document conversion
# Conversion support functions
# called by .convertDocs()
.swap <- function(file, header=NULL, outDir, rmdChunkID, rnwChunkID, emphasis, overwrite, ...){
	title <- list(...)$title
	author <- list(...)$author
	highlight <- list(...)$highlight
	ext <- tail(strsplit(file, "\\.")[[1]], 1)
	l <- readLines(file)
	l <- l[substr(l, 1, 7)!="<style>"] # Strip any html style lines
	if(ext=="Rmd"){
		from <- rmdChunkID; to <- rnwChunkID
		hl.default <- "solarized-light"
		out.ext <- "Rnw"
		h.ind <- 1:which(l=="---")[2]
		h <- l[h.ind]
		t.ind <- which(substr(h, 1, 7)=="title: ")
		a.ind <- which(substr(h, 1, 8)=="author: ")
		highlight.ind <- which(substr(h, 1, 11)=="highlight: ")
		if(is.null(title) & length(t.ind)) title <- substr(h[t.ind], 8, nchar(h[t.ind])) else if(is.null(title)) title <- ""
		if(is.null(author) & length(a.ind)) author <- substr(h[a.ind], 9, nchar(h[a.ind])) else if(is.null(author)) author <- ""
		if(is.null(highlight) & length(highlight.ind)) highlight <- substr(h[highlight.ind], 12, nchar(h[highlight.ind])) else if(is.null(highlight)) highlight <- hl.default else if(!(highlight %in% knit_theme$get())) highlight <- hl.default
		if(!is.null(title)) header <- c(header, paste0("\\title{", title, "}"))
		if(!is.null(author)) header <- c(header, paste0("\\author{", author, "}"))
		if(!is.null(title)) header <- c(header, "\\maketitle\n")
		header <- c(header, paste0("<<highlight, echo=FALSE>>=\nknit_theme$set(knit_theme$get('", highlight, "'))\n@\n"))
	} else if(ext=="Rnw") {
		from <- rnwChunkID; to <- rmdChunkID
		hl.default <- "tango"
		out.ext <- "Rmd"
		begin.doc <- which(l=="\\begin{document}")
		make.title <- which(l=="\\maketitle")
		if(length(make.title)) h.ind <- 1:make.title else h.ind <- 1:begin.doc
		h <- l[h.ind]
		t.ind <- which(substr(h, 1, 6)=="\\title")
		a.ind <- which(substr(h, 1, 7)=="\\author")
		highlight.ind <- which(substr(l, 1, 11)=="<<highlight")
		if(is.null(title) & length(t.ind)) title <- substr(h[t.ind], 8, nchar(h[t.ind])-1)
		if(is.null(author) & length(a.ind)) author <- substr(h[a.ind], 9, nchar(h[a.ind])-1)
		if(length(highlight.ind)){
			l1 <- l[highlight.ind+1]
			h1 <- substr(l1, nchar("knit_theme$set(knit_theme$get('") + 1, nchar(l1) - nchar("'))\n"))
			if(!(h1 %in% knit_theme$get())) h1 <- hl.default
		}
		if(is.null(highlight) & length(highlight.ind)) highlight <- h1 else if(is.null(highlight)) highlight <- hl.default else if(!(highlight %in% knit_theme$get())) highlight <- hl.default
		header <- rmdHeader(title=title, author=author, highlight=highlight)
		h.chunks <- .swapChunks(from=from, to=to, x=h, offset.end=0)
		header <- c(header, h.chunks[[1]][h.chunks[[2]]])
	}
	header <- paste0(header, collapse="\n")
	l <- paste0(l[-h.ind], "\n")
	l <- .swapHeadings(from=from, to=to, x=l)
	chunks <- .swapChunks(from=from, to=to, x=l)
	l <- chunks[[1]]
	if(ext=="Rmd") l <- .swapEmphasis(x=l, emphasis=emphasis)
	if(ext=="Rmd") l[-chunks[[2]]] <- sapply(l[-chunks[[2]]], function(v, p, r) gsub(p, r, v), p="_", r="\\\\_")
	l <- c(header, l)
	if(ext=="Rmd") l <- c(l, "\n\\end{document}\n")
	if(ext=="Rnw"){
		ind <- which(substr(l, 1, 1)=="\\") # drop any remaining lines beginning with a backslash
		l <- l[-ind]
	}
	outfile <- file.path(outDir, gsub(paste0("\\.", ext), paste0("\\.", out.ext), basename(file)))
	if(overwrite || !file.exists(outfile)){
		sink(outfile)
		sapply(l, cat)
		sink()
		print(paste("Writing", outfile))
	}
}

# @knitr fun_convertDocs
# Rmd <-> Rnw document conversion
# Main conversion function
convertDocs <- function(path, rmdChunkID=c("```{r", "}", "```"), rnwChunkID=c("<<", ">>=", "@"), emphasis="replace", overwrite=FALSE, ...){
	stopifnot(is.character(path))
	type <- basename(path)
	rmd.files <- list.files(path, pattern=".Rmd$", full=TRUE)
	rnw.files <- list.files(path, pattern=".Rnw$", full=TRUE)
	dots <- list(...)
	if(rmdChunkID[1]=="```{r") rmdChunkID[1] <- paste0(rmdChunkID[1], " ")
	if(type=="Rmd"){
		stopifnot(length(rmd.files) > 0)
		outDir <- file.path(dirname(path), "Rnw")
		if(is.null(doc.class <- dots$doc.class)) doc.class <- "article"
		if(is.null(doc.packages <- dots$doc.packages)) doc.packages <- "geometry"
		doc.class.string <- paste0("\\documentclass{", doc.class, "}")
		doc.packages.string <- paste0(sapply(doc.packages, function(x) paste0("\\usepackage{", x, "}")), collapse="\n")
		if("geometry" %in% doc.packages) doc.packages.string <- c(doc.packages.string, "\\geometry{verbose, tmargin=2.5cm, bmargin=2.5cm, lmargin=2.5cm, rmargin=2.5cm}")
		header.rnw <- c(doc.class.string, doc.packages.string, "\\begin{document}\n")#,
			#paste0("<<highlight, echo=FALSE>>=\nknit_theme$set(knit_theme$get('", theme, "'))\n@\n"))
	} else if(type=="Rnw") {
		stopifnot(length(rnw.files) > 0)
		outDir <- file.path(dirname(path), "Rmd")
	} else stop("path must end in 'Rmd' or 'Rnw'.")
	if(type=="Rmd"){
		sapply(rmd.files, .swap, header=header.rnw, outDir=outDir, rmdChunkID=rmdChunkID, rnwChunkID=rnwChunkID, emphasis=emphasis, overwrite=overwrite, ...)
		cat(".Rmd to .Rnw file conversion complete.\n")
	} else {
		sapply(rnw.files, .swap, header=NULL, outDir=outDir, rmdChunkID=rmdChunkID, rnwChunkID=rnwChunkID, emphasis=emphasis, overwrite=overwrite, ...)
		cat(".Rnw to .Rmd file conversion complete.\n")
	}
}

# @knitr fun_moveDocs
# Organization documentation
moveDocs <- function(path.docs, type=c("md", "html","pdf"), move=TRUE, copy=FALSE, remove.latex=TRUE, latexDir="latex"){
	if(any(!(type %in% c("md", "html","pdf")))) stop("type must be among 'md', 'html', and 'pdf'")
	stopifnot(move | copy)
	if(path.docs=="." | path.docs=="./") path.docs <- getwd()
	if(strsplit(path.docs, "/")[[1]][1]==".."){
		tmp <- strsplit(path.docs, "/")[[1]][-1]
		if(length(tmp)) path.docs <- file.path(getwd(), paste0(tmp, collapse="/")) else stop("Check path.docs argument.")
	}
	for(i in 1:length(type)){
		if(type[i]=="pdf") origin <- "Rnw" else origin <- "Rmd"
		path.i <- file.path(path.docs, origin)
		infiles <- list.files(path.i, pattern=paste0("\\.", type[i], "$"), full=TRUE)
		if(type[i]=="pdf"){
			extensions <- c("tex", "aux", "log")
			all.pdfs <- basename(list.files(path.docs, pattern=".pdf$", full=T, recursive=T))
			pat <- paste0("^", rep(gsub("pdf", "", all.pdfs), length(extensions)), rep(extensions, each=length(all.pdfs)), "$")
			latex.files <- unlist(sapply(1:length(pat), function(p, path, pat) list.files(path, pattern=pat[p], full=TRUE), path=path.i, pat=pat))
			print(latex.files)
			if(length(latex.files)){
				if(remove.latex){
					unlink(latex.files)
				} else {
					dir.create(file.path(path.docs, latexDir), showWarnings=FALSE, recursive=TRUE)
					file.rename(latex.files, file.path(path.docs, latexDir, basename(latex.files)))
				}
			}
		}
		if(length(infiles)){
			infiles <- infiles[basename(dirname(infiles))==origin]
			if(length(infiles)){
				if(type[i]=="html"){
					html.dirs <- gsub("\\.html", "_files", infiles)
					dirs <- list.dirs(path.i, recursive=FALSE)
					ind <- which(dirs %in% html.dirs)
					if(length(ind)){
						html.dirs <- dirs[ind]
						html.dirs.recur <- list.dirs(html.dirs)
						for(p in 1:length(html.dirs.recur))	dir.create(gsub("/Rmd", "/html", html.dirs.recur[p]), recursive=TRUE, showWarnings=FALSE)
						subfiles <- unique(unlist(lapply(1:length(html.dirs.recur), function(p, path) list.files(path[p], full=TRUE), path=html.dirs.recur)))
						subfiles <- subfiles[!(subfiles %in% html.dirs.recur)]
						file.copy(subfiles, gsub("/Rmd", "/html", subfiles), overwrite=TRUE)
						if(move) unlink(html.dirs, recursive=TRUE)
					}
				}
				outfiles <- file.path(path.docs, type[i], basename(infiles))
				if(move) file.rename(infiles, outfiles) else if(copy) file.copy(infiles, outfiles, overwrite=TRUE)
			}
		}
	}
}

# @knitr fun_getProjectStats
# Compile project code and documentation statistics and other metadataR
# Count R scripts, standard functions, lines of code, hierarchical function tree,
# number of Rmd documents, lines of documentation,
# Shiny app reactive expressions not yet included, e.g.,
# input references, output references, render* calls
# other references of interest in the code, e.g., number of conditional panels in a Shiny app
# These instances would be easy to count but a hierarchical reactive elements tree would be challenging
# 'type' argument not currently in use
getProjectStats <- function(path, type=c("project", "app"), code=TRUE, docs=TRUE, exclude=NULL){

	if(!(code | docs)) stop("At least one of 'code' or 'docs' must be TRUE.")
	r.files <- if(code) list.files(path, pattern=".R$", full=TRUE, recursive=TRUE) else NULL
	rmd.files <- if(docs) list.files(path, pattern=".Rmd$", full=TRUE, recursive=TRUE) else NULL
	
	getFunctionInfo <- function(x, func.names=NULL, func.lines=NULL){
		if(is.null(func.names) & is.null(func.lines)){
			x.split <- strsplit(gsub(" ", "", x), "<-function\\(")
			func.ind <- which(sapply(x.split, length) > 1 & !(substr(x, 1, 1) %in% c(" ", "\t")))
			n <- length(func.ind)
			func.names <- if(n > 0) sapply(x.split[func.ind], "[[", 1) else stop("No functions found.")
			func.close <- rep(NA, n)
			for(i in 1:n){
				func.ind2 <- if(i < n) min(func.ind[i+1] - 1, length(x)) else length(x)
				ind <- func.ind[i]:func.ind2
				func.close[i] <- ind[which(nchar(x[ind])==1 & x[ind]=="}")[1]]
			}
			func.lines <- mapply(seq, func.ind, func.close)
			if(!is.list(func.lines)) func.lines <- as.list(data.frame(func.lines))
			return(list(func.names=func.names, func.lines=func.lines, n.func=n))
		} else {
			m <- c()
			n <- length(func.names)
			for(i in 1:n){
				func.ref <- rep(NA, n)
				for(j in c(1:n)[-i]){
					x.tmp <- x[func.lines[[i]]]
					x.tmp <- gsub(paste0(func.names[j], "\\("), "_1_SOMETHING_TO_SPLIT_ON_2_", x.tmp) # standard function usage
					x.tmp <- gsub(paste0("do.call\\(", func.names[j]), "_1_SOMETHING_TO_SPLIT_ON_2_", x.tmp) # function reference inside do.call()
					x.tmp <- gsub(paste0(func.names[j], ","), "_1_SOMETHING_TO_SPLIT_ON_2_", x.tmp) # function reference followed by mere comma, e.g., in *apply functions: NOT IDEAL
					x.tmp.split <- strsplit(x.tmp, "SOMETHING_TO_SPLIT_ON")
					func.ref[j] <- any(sapply(x.tmp.split, length) > 1)
				}
				m.tmp <- if(any(func.ref, na.rm=TRUE)) cbind(func.names[i], func.names[which(func.ref)]) else cbind(func.names[i], NA)
				m <- rbind(m, m.tmp)
			}
			return(flow=m)
		}
	}
	
	if(is.character(exclude) & length(r.files)) r.files <- r.files[!(basename(r.files) %in% exclude)]
	n.scripts <- length(r.files)
	if(n.scripts > 0){
		l <- unlist(lapply(r.files, readLines))
		n.codelines <- length(l[l != ""])
		func.info <- getFunctionInfo(l)
		func.names <- func.info$func.names
		n.func <- func.info$n.func
		func.mat <- getFunctionInfo(l, func.names=func.names, func.lines=func.info$func.lines)
	} else { n.codelines <- n.func <- 0; func.names <- func.mat <- NULL }
	
	if(is.character(exclude) & length(rmd.files)) rmd.files <- rmd.files[!(basename(r.files) %in% exclude)]
	n.docs <- length(rmd.files)
	if(n.docs > 0){
		l <- unlist(lapply(rmd.files, readLines))
		n.doclines <- length(l[l != ""])
	} else { n.doclines <- 0 }
	
	total.files <- length(list.files(path, recursive=TRUE))	
	
	return(list(total.files=total.files, n.docs=n.docs, n.doclines=n.doclines, n.scripts=n.scripts, n.codelines=n.codelines, n.func=n.func, func.mat=func.mat))
}

# @knitr fun_buttonGroup
# Functions for Github websites
buttonGroup <- function(txt, urls, fa.icons=NULL, colors="primary", solid.group=FALSE){
	stopifnot(is.character(txt) & is.character(urls))
	n <- length(txt)
	stopifnot(length(urls)==n)
	stopifnot(colors %in% c("default", "primary", "success", "info", "warning", "danger", "link"))
	stopifnot(n %% length(colors)==0)
	if(is.null(fa.icons)) icons <- vector("list", length(txt)) else if(is.character(fa.icons)) icons <- as.list(fa.icons) else stop("fa.icons must be character or NULL")
	stopifnot(length(icons)==n)
	if(length(colors) < n) colors <- rep(colors, length=n)
	
	btnlink <- function(i, txt, url, icon, col){
		x <- paste0('<a class="btn btn-', col[i], '" href="', url[i], '">')
		y <- if(is.null(icon[[i]])) "" else paste0('<i class="fa fa-', icon[[i]], ' fa-lg"></i>')
		z <- paste0(" ", txt[i], '</a>\n')
		paste0(x, y, z)
	}
	
	x <- if(solid.group) '<div class="btn-group btn-group-justified">\n' else ""
	y <- paste0(sapply(1:length(txt), btnlink, txt=txt, url=urls, icon=icons, col=colors), collapse="")
	z <- if(solid.group) '</div>\n' else ""
	paste0(x, y, z)
}

# @knitr fun_genNavbar
genNavbar <- function(htmlfile="navbar.html", title, menu, submenus, files, title.url="index.html", home.url="index.html", site.url="", site.name="Github", media.button.args=NULL, include.home=FALSE){
	ncs <- c("navbar-brand", "navbar-collapse collapse navbar-responsive-collapse", "nav navbar-nav", "nav navbar-nav navbar-right", "container", "navbar-header", "      </div>\n", "navbar-toggle", ".navbar-responsive-collapse", "")
	
	if(!is.null(media.button.args)){
		media.buttons <- do.call(buttonGroup, media.button.args)
	} else if(site.name=="Github" & site.url!="") {
		media.buttons <- paste0('<a class="btn btn-link" href="', site.url, '">\n            <i class="fa fa-github fa-lg"></i>\n            ',site.name,'\n          </a>\n')
	} else media.buttons <- ""
	
	fillSubmenu <- function(x, name, file){
		dd.menu.header <- "dropdown-header"
		if(file[x]=="divider") return('              <li class="divider"></li>\n')
		if(file[x]=="header") return(paste0('              <li class="', dd.menu.header, '">', name[x], '</li>\n'))
		paste0('              <li><a href="', file[x], '">', name[x], '</a></li>\n')
	}
	
	fillMenu <- function(x, menu, submenus, files){
		m <- menu[x]
		gs.menu <- gsub(" ", "-", tolower(m))
		s <- submenus[[x]]
		f <- files[[x]]
		if(s[1]=="empty"){
			y <- paste0('<li><a href="', f,'">', m, '</a></li>\n')
		} else {
			y <- paste0(
			'<li class="dropdown">\n            <a href="', 
				gs.menu, 
				'" class="dropdown-toggle" data-toggle="dropdown">', m, 
				' <b class="caret"></b></a>\n            <ul class="dropdown-menu">\n',
				paste(sapply(1:length(s), fillSubmenu, name=s, file=f), sep="", collapse=""),
				'            </ul>\n', collapse="")
		}
	}
	
	if(include.home) home <- paste0('<li><a href="', home.url, '">Home</a></li>\n          ') else home <- ""
	x <- paste0(
		'<div class="navbar navbar-default navbar-fixed-top">\n  <div class="', ncs[5], '">\n    <div class="', ncs[6], '">\n      <button type="button" class="', ncs[8], '" data-toggle="collapse" data-target="', ncs[9], '">\n        <span class="icon-bar"></span>\n        <span class="icon-bar"></span>\n        <span class="icon-bar"></span>\n      </button>\n      <a class="', ncs[1], '" href="', title.url, '">', title, '</a>\n', ncs[7], '      <div class="', ncs[2], '">\n        <ul class="', ncs[3], '">\n          ',
		home,
		paste(sapply(1:length(menu), fillMenu, menu=menu, submenus=submenus, files=files), sep="", collapse="\n          "),
		'        </ul>\n        <ul class="', ncs[4], '">\n          ', media.buttons, '        </ul>\n      </div><!--/.nav-collapse -->\n    </div>\n  ', ncs[10], '</div>\n',
		collpase="")
	sink(htmlfile)
	cat(x)
	sink()
	x
}

# @knitr fun_genOutyaml
genOutyaml <- function(file, theme="cosmo", highlight="zenburn", lib=NULL, header=NULL, before_body=NULL, after_body=NULL){
	output.yaml <- paste0('html_document:\n  self_contained: false\n  theme: ', theme, '\n  highlight: ', highlight, '\n  mathjax: null\n  toc_depth: 2\n')
	if(!is.null(lib)) output.yaml <- paste0(output.yaml, '  lib_dir: ', lib, '\n')
	output.yaml <- paste0(output.yaml, '  includes:\n')
	if(!is.null(header)) output.yaml <- paste0(output.yaml, '    in_header: ', header, '\n')
	if(!is.null(before_body)) output.yaml <- paste0(output.yaml, '    before_body: ', before_body, '\n')
	if(!is.null(after_body)) output.yaml <- paste0(output.yaml, '    after_body: ', after_body, '\n')
	sink(file)
	cat(output.yaml)
	sink()
	output.yaml
}

# @knitr fun_insert_gatc
insert_gatc <- function(file, gatc=NULL){
	nc <- nchar(file)
	stopifnot(all(substr(file, nc-4, nc)==".html"))
	l <- lapply(file, readLines)
	l.ind <- sapply(l, function(x) which(gsub(" ", "", substr(x, 1, 7)) == "</head>"))
	if(is.null(gatc)) gatc <-
"<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46129458-3', 'auto');
  ga('send', 'pageview');

</script>\n
"
	l <- lapply(1:length(l), function(i, x, ind, gatc) { x[[i]][ind[i]] <- paste0(gatc, "\n</head>"); x[[i]] }, x=l, ind=l.ind, gatc=gatc)
	lapply(1:length(file),
		function(i, file, x){
			sink(file[i])
			x <- x[[i]]
			x <- paste0(x, "\n")
			sapply(x, cat)
			sink()
		}, file=file, x=l)
	
	cat("Google Analytics tracking script inserted.\n")
}

# @knitr fun_genPanelDiv
genPanelDiv <- function(outDir, type="projects", main="Projects",
	github.user="leonawicz", prjs.dir="C:/github", exclude=c("leonawicz.github.io", "shiny-apps", "eris2", "DataVisExamples", ".git", "_images"),
	img.loc="_images/small", lightbox=FALSE, include.buttons=TRUE, include.titles=TRUE, ...){
	
	stopifnot(github.user %in% c("leonawicz", "ua-snap"))
	dots <- list(...)
	
	if(type=="apps"){
		filename <- "apps_container.html"
		web.url <- "http://shiny.snap.uaf.edu"
		gh.url.tail <- "shiny-apps/tree/master"
		atts <- ' target="_blank"'
		go.label <- "Launch"
		prjs.dir <- file.path(prjs.dir, "shiny-apps")
		prjs.img <- list.files(file.path(prjs.dir, img.loc))
		prjs <- sapply(strsplit(prjs.img, "\\."), "[[", 1)
	}
	if(type=="projects"){
		filename <- "projects_container.html"
		web.url <- paste0("http://", github.user, ".github.io")
		gh.url.tail <- ""
		atts <- ""
		go.label <- "Website"
		prjs <- list.dirs(prjs.dir, full=TRUE, recursive=FALSE)
		prjs <- prjs[!(basename(prjs) %in% exclude)]
		prjs.img <- sapply(1:length(prjs), function(i, a) list.files(file.path(a[i], "plots"), pattern=paste0("^_", basename(a)[i])), a=prjs)
		prjs <- basename(prjs)
	}
	if(type=="datavis"){
		filename <- "data-visualizations_container.html"
		web.url <- paste0("http://", github.user, ".github.io")
		gh.url.tail <- "DataVisExamples/tree/master"
		atts <- ""
		go.label <- "See More"
		prjs.dir <- file.path(prjs.dir, "DataVisExamples")
		prjs.img <- list.files(file.path(prjs.dir, img.loc))
		prjs <- sapply(strsplit(prjs.img, "\\."), "[[", 1)
	}
	if(type=="gallery"){
		web.url <- paste0("http://", github.user, ".github.io")
		gh.url.tail <- "DataVisExamples/tree/master"
		if(lightbox) atts1 <- ' data-lightbox="ID"' else atts1 <- ""
		go.label <- "Expand"
		prjs <- list.dirs(file.path(prjs.dir, "DataVisExamples"), full=T, recursive=F)
		prjs <- prjs[!(basename(prjs) %in% exclude)]
		prjs.img <- lapply(1:length(prjs), function(x, files, imgDir) list.files(path=file.path(files[x], imgDir), recursive=FALSE), files=prjs, imgDir=img.loc)
		prjs <- basename(prjs)
		filename <- tolower(paste0("gallery-", gsub(" ", "-", gsub(" - ", " ", prjs)), ".html"))
	}
	gh.url <- file.path("https://github.com", github.user, gh.url.tail)
	
    fillRow <- function(i, ...){
		prj <- panels[i]
		go.label <- go.label[i]
		col <- col[i]
	    panel.main <- panel.main[i]
		if(type=="apps") img.src <- file.path(gsub("/tree/", "/raw/", gh.url), img.loc, prjs.img[i])
		if(type=="projects") img.src <- file.path(gh.url, prj, "raw/master/plots", prjs.img[i])
		if(type=="datavis") img.src <- file.path(gsub("/tree/", "/raw/", gh.url), img.loc, prjs.img[i])
	    if(type!="gallery"){
			if(type=="datavis"){
				pfx <- "gallery-"
				sfx <- ".html"
				base <- tolower(paste0(pfx, gsub("_", "-", gsub("_-_", "-", prj)), sfx))
			} else {
				base <- prj
			}
			web.url <- file.path(web.url, base)
		} else {
			prj <- prjs[p]
			img.src <- file.path(gsub("/tree/", "/raw/", gh.url), prjs[p], img.loc, panels[i])
			web.url <- file.path(gsub("/tree/", "/raw/", gh.url), prjs[p], panels[i])
			if(lightbox) atts <- gsub("ID", gsub(" - ", ": ", gsub("_", " ", prjs[p])), atts1) else atts <- atts1
		}
		if(include.titles){
		panel.title <- paste0('<div class="panel-heading"><h3 class="panel-title">', panel.main, '</h3>
          </div>\n          ')
		} else panel.title <- ""
		if(include.buttons){
			if(go.label=="UAF ONLY") { web.url <- "#apps"; atts <- ""; go.btn <- "danger" } else go.btn <- "success"
			panel.buttons <- paste0('<div class="btn-group btn-group-justified">
			<a href="', web.url, '"', atts, ' class="btn btn-', go.btn, '">', go.label, '</a>
			<a href="', file.path(gh.url, prj), '" class="btn btn-info">Github</a>
		  </div>\n        ')
		} else panel.buttons <- ""
	    x <- paste0('    <div class="col-lg-4">
      <div class="bs-component">
        <div class="panel panel-', col, '">\n          ', panel.title,
         '<div class="panel-body"><a href="', web.url, '"', atts, '><img src="', img.src, '" alt="', panel.main, '" width=100% height=200px></a><p></p>\n          ', panel.buttons,
		 '  </div>\n        </div>\n      </div>\n    </div>\n  ')
	}
	
	for(p in 1:length(filename)){
		if(type=="gallery"){
			panels <- prjs.img[[p]]
			main <- gsub(" - ", ": ", gsub("_", " ", prjs[p]))
		} else panels <- prjs
		n <- length(panels)
		if(is.null(dots$go.label)) go.label <- rep(go.label, length=n) else go.label <- rep(dots$go.label, length=n)
		if(is.null(dots$col)) col <- rep("warning", length=n) else col <- rep(dots$col, length=n)
		if(is.null(dots$panel.main)) panel.main <- gsub(" - ", ": ", gsub("_", " ", panels)) else panel.main <- rep(dots$panel.main, length=n)
		seq1 <- seq(1, n, by=3)
		x <- paste0('<div class="container">\n  <div class="row">\n    <div class="col-lg-12">\n      <div class="page-header">\n        <h3 id="', type, '">', main, '</h3>\n      </div>\n    </div>\n  </div>\n  ')
		y <- c()
		for(j in 1:length(seq1)){
			ind <- seq1[j]:(seq1[j] + 2)
			ind <- ind[ind %in% 1:n]
			y <- c(y, paste0('<div class="row">\n', paste0(sapply(ind, fillRow, panels=panels, go.label=go.label, col=col, panel.main=panel.main), collapse="\n"), '</div>\n'))
		}
		z <- '</div>\n'
		sink(file.path(outDir, filename[p]))
		sapply(c(x, y, z), cat)
		sink()
		cat("div container html file created.\n")
	}
}

# @knitr fun_htmlHead
htmlHead <- function(author="Matthew Leonawicz", title=author, script.paths=NULL, stylesheet.paths, stylesheet.args=vector("list", length(path.stylesheets)), include.ga=TRUE, ...){
x <- paste0('<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<meta name="author" content=', author, ' />

<title>', title, '</title>
')

if(is.character(script.paths)) x <- c(x, paste0(paste0('<script src="', script.paths, '"></script>', collapse="\n"), "\n"))

x <- c(x, '<meta name="viewport" content="width=device-width, initial-scale=1.0" />\n')

if(is.character(stylesheet.paths)){
	n <- length(stylesheet.paths)
	stopifnot(is.list(stylesheet.args))
	stopifnot(length(stylesheet.args)==n)
	for(i in 1:n){
		string <- ""
		if(is.list(stylesheet.args[i])){
			v <- stylesheet.args[i]
			arg <- names(v)
			if(is.character(arg) && all(arg!="")) string <- paste0(" ", paste(arg, paste0('\"', v, '\"'), sep="=", collapse=" "))
		}
		x <- c(x, paste0('<link rel="stylesheet" href="', stylesheet.paths[i], '"', string, '>\n'))
	}
}

if(include.ga) {
x <- c(x,
"<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46129458-3', 'auto');
  ga('send', 'pageview');

</script>\n
")
}

x <- c(x, '</head>\n')
x

}

# @knitr fun_htmlBodyTop
htmlBodyTop <- function(css.file=NULL, css.string=NULL, background.image="", include.default=TRUE, ...){
	x <- '<body>\n<style type = "text/css">\n'
	
	default <- paste0('
	.main-container {
	  max-width: 940px;
	  margin-left: auto;
	  margin-right: auto;

	}

	body {
	  background-image: url("', background.image, '");
	  background-attachment: fixed;
	  background-size: 1920px 1080px;
	}
	
	/* padding for bootstrap navbar */
	body {
	  padding-top: 50px;
	  padding-bottom: 40px;
	}
	@media (max-width: 979px) {
	  body {
		padding-top: 0;
	  }
	}
	
	.nav>.btn {
	  line-height: 0.75em;
	  margin-top: 9px;
	}
	')
	
	if(!is.null(css.file)) y <- readLines(css.file) else y <- ""
	if(!is.null(css.string)) y <- c(y, css.string)
	if(include.default) y <- c(default, y)
	
	z <- '\n</style>\n'

	c(x, y, z)
}

# @knitr fun_htmlBottom
htmlBottom <- function(...){ # temporary
	'<div class="container">Site made with <a href="http://leonawicz.github.io/ProjectManagement">rpm</a></div>\n</body>\n</html>'
}


# @knitr fun_genUserPage
genUserPage <- function(file="C:/github/leonawicz.github.io/index.html", containers=NULL, navbar="", ...){
	x1 <- htmlHead(...)
	x2 <- htmlBodyTop(...)
	if(!is.null(containers)) x3 <- sapply(containers, function(x) paste0(paste0(readLines(x), collapse="\n"), "\n\n")) else x3 <- ""
	x4 <- htmlBottom(...)
	nb <- if(file.exists(navbar) && substr(navbar, nchar(navbar)-4, nchar(navbar))==".html") nb <- paste0(paste0(readLines(navbar), collapse="\n"), "\n\n")
	sink(file)
	sapply(c(x1, x2, nb, x3, x4), cat)
	sink()
	cat("Github User page html file created.\n")
}
