# Project Management
Matthew Leonawicz  




## Introduction
This is a project management project.
While current projects are shown in the chart below, the aim of this project is the development of convenient **R**-related project management tools.

### Motivation
I am working on these tools to enhance my own workflow across multiple **R** projects.

### Details
**R** code for the project will be compiled into an **R** package, `rpm` for easy use.
This is a personal package and will not be available anywhere but my github repository,
but you are welcome to explore the package and functions.
It is unlikely that you would manage your **R** projects in the same manner that I do,
but if you do, or just want some ideas, feel free to explore.

#### Capabilities
`rpm` can create a new project. This essentially generates a specific directory structure which I use often to manage project files.
For an existing project, once **R** scripts have been created, `rpm` can generate template Rmd files for each.
For existing Rmd files, `rpm` can conveniently append these **R** Markdown files with a list of any new `knitr` code chunk names
in project **R** scripts being developed which have not yet been included in the respective Rmd files.

#### Limitations
While `rpm` assists with project documentation, this mainly takes the form of file generation and appending.
Documentation is unique to every project of course. Every script is different.
The most that is possible is to auto-fill commonly used code chunk names and metadata.
Each document must be written individually by the author, but when a project has many **R** scripts requiring documentation,
it is nice to not have to create all the corresponding Rmd files by hand and copy and paste generic contents.

The project management code is not yet in package form.
Many additional features are yet to be incorporated.
Generic code relating to the further processing of Rmd files into various other output files via `rmarkdown` and `knitr` remains at an early development stage.

## Related items
Currently there is only this unpackaged **R** script, accompanying code for a projects hierarchy diagram
and a code flow diagram based on the current development of this project, and a simple script for generating documents based on project **R** code.

### Files and Data
This project does not use any data.
It does make use of supplemental libraries for formatting during html document generation.
`proj_sankey.R` and `code_sankey.R` are used to produce of project hierarchy diagram of my current projects and a code flow diagram for this project, respectively.
`drg.R` is used to assist in dynamic report generation.

### Code flow
The Sankey diagram has become part of project management.
Each project has its own, detailing the relationships among **R** code and data relevant to the project,
and in some cases, how they relate to code and data files which are more general and span multiple projects.
In general, for my projects I would only provide the code flow diagram here among the rest of the project documentation,
but since this is the project management project and I am introducing its use,
in this case I will also show the [code](code_sankey.html "code") I use to make the diagram.

### Current projects
Here is a project hierarchy diagram showing the relationships among all my current projects.



<iframe srcdoc=' &lt;!doctype HTML&gt;
&lt;meta charset = &#039;utf-8&#039;&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;link rel=&#039;stylesheet&#039; href=&#039;http://timelyportfolio.github.io/rCharts_d3_sankey/css/sankey.css&#039;&gt;
    
    &lt;script src=&#039;http://d3js.org/d3.v3.min.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://timelyportfolio.github.io/rCharts_d3_sankey/js/sankey.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    
    &lt;style&gt;
    .rChart {
      display: block;
      margin-left: auto; 
      margin-right: auto;
      width: 900px;
      height: 800px;
    }  
    &lt;/style&gt;
    
  &lt;/head&gt;
  &lt;body &gt;
    
    &lt;div id = &#039;chart28c6a2e41bc&#039; class = &#039;rChart d3_sankey&#039;&gt;&lt;/div&gt;    
    ï»¿&lt;!--Attribution:
Mike Bostock https://github.com/d3/d3-plugins/tree/master/sankey
Mike Bostock http://bost.ocks.org/mike/sankey/
--&gt;

&lt;script&gt;
(function(){
var params = {
 &quot;dom&quot;: &quot;chart28c6a2e41bc&quot;,
&quot;width&quot;:    900,
&quot;height&quot;:    800,
&quot;data&quot;: {
 &quot;source&quot;: [ &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Alec&quot;, &quot;Angie&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;Alfresco Outputs&quot;, &quot;Alfresco Outputs&quot;, &quot;Alfresco Outputs&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Training/Supervision&quot;, &quot;Training/Supervision&quot;, &quot;Randscape Development&quot;, &quot;Randscape Development&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot; ],
&quot;target&quot;: [ &quot;Paul&quot;, &quot;Alec&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot;, &quot;rpm&quot;, &quot;SNAP Data QA/QC&quot;, &quot;Training/Supervision&quot;, &quot;R Shiny Apps General Maintenance&quot;, &quot;New App Development&quot;, &quot;SNAP Tech Blog&quot;, &quot;Continuing Education&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;Moose Project&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Growing Season&quot;, &quot;Mussel Project&quot;, &quot;Land Carbon&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Growing Season&quot;, &quot;Mussel Project&quot;, &quot;Land Carbon&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Shiny App Server Migration&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Shiny App Server Migration&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Land Carbon&quot;, &quot;Bird Project&quot;, &quot;Alfresco Outputs&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Randscape Development&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Outputs&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Alfresco Outputs&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot; ],
&quot;value&quot;: [      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1 ] 
},
&quot;nodeWidth&quot;:     15,
&quot;nodePadding&quot;:     10,
&quot;layout&quot;:     32,
&quot;margin&quot;: {
 &quot;right&quot;:     20,
&quot;left&quot;:     20,
&quot;bottom&quot;:     20,
&quot;top&quot;:     20 
},
&quot;title&quot;: &quot;Matt&#039;s Projects&quot;,
&quot;id&quot;: &quot;chart28c6a2e41bc&quot; 
};

params.units ? units = &quot; &quot; + params.units : units = &quot;&quot;;

//hard code these now but eventually make available
var formatNumber = d3.format(&quot;0,.0f&quot;),    // zero decimal places
    format = function(d) { return formatNumber(d) + units; },
    color = d3.scale.category20();

if(params.labelFormat){
  formatNumber = d3.format(&quot;.2%&quot;);
}

var svg = d3.select(&#039;#&#039; + params.id).append(&quot;svg&quot;)
    .attr(&quot;width&quot;, params.width)
    .attr(&quot;height&quot;, params.height);
    
var sankey = d3.sankey()
    .nodeWidth(params.nodeWidth)
    .nodePadding(params.nodePadding)
    .layout(params.layout)
    .size([params.width,params.height]);
    
var path = sankey.link();
    
var data = params.data,
    links = [],
    nodes = [];
    
//get all source and target into nodes
//will reduce to unique in the next step
//also get links in object form
data.source.forEach(function (d, i) {
    nodes.push({ &quot;name&quot;: data.source[i] });
    nodes.push({ &quot;name&quot;: data.target[i] });
    links.push({ &quot;source&quot;: data.source[i], &quot;target&quot;: data.target[i], &quot;value&quot;: +data.value[i] });
}); 

//now get nodes based on links data
//thanks Mike Bostock https://groups.google.com/d/msg/d3-js/pl297cFtIQk/Eso4q_eBu1IJ
//this handy little function returns only the distinct / unique nodes
nodes = d3.keys(d3.nest()
                .key(function (d) { return d.name; })
                .map(nodes));

//it appears d3 with force layout wants a numeric source and target
//so loop through each link replacing the text with its index from node
links.forEach(function (d, i) {
    links[i].source = nodes.indexOf(links[i].source);
    links[i].target = nodes.indexOf(links[i].target);
});

//now loop through each nodes to make nodes an array of objects rather than an array of strings
nodes.forEach(function (d, i) {
    nodes[i] = { &quot;name&quot;: d };
});

sankey
  .nodes(nodes)
  .links(links)
  .layout(params.layout);
  
var link = svg.append(&quot;g&quot;).selectAll(&quot;.link&quot;)
  .data(links)
.enter().append(&quot;path&quot;)
  .attr(&quot;class&quot;, &quot;link&quot;)
  .attr(&quot;d&quot;, path)
  .style(&quot;stroke-width&quot;, function (d) { return Math.max(1, d.dy); })
  .sort(function (a, b) { return b.dy - a.dy; });

link.append(&quot;title&quot;)
  .text(function (d) { return d.source.name + &quot; â†’ &quot; + d.target.name + &quot;\n&quot; + format(d.value); });

var node = svg.append(&quot;g&quot;).selectAll(&quot;.node&quot;)
  .data(nodes)
.enter().append(&quot;g&quot;)
  .attr(&quot;class&quot;, &quot;node&quot;)
  .attr(&quot;transform&quot;, function (d) { return &quot;translate(&quot; + d.x + &quot;,&quot; + d.y + &quot;)&quot;; })
.call(d3.behavior.drag()
  .origin(function (d) { return d; })
  .on(&quot;dragstart&quot;, function () { this.parentNode.appendChild(this); })
  .on(&quot;drag&quot;, dragmove));

node.append(&quot;rect&quot;)
  .attr(&quot;height&quot;, function (d) { return d.dy; })
  .attr(&quot;width&quot;, sankey.nodeWidth())
  .style(&quot;fill&quot;, function (d) { return d.color = color(d.name.replace(/ .*/, &quot;&quot;)); })
  .style(&quot;stroke&quot;, function (d) { return d3.rgb(d.color).darker(2); })
.append(&quot;title&quot;)
  .text(function (d) { return d.name + &quot;\n&quot; + format(d.value); });

node.append(&quot;text&quot;)
  .attr(&quot;x&quot;, -6)
  .attr(&quot;y&quot;, function (d) { return d.dy / 2; })
  .attr(&quot;dy&quot;, &quot;.35em&quot;)
  .attr(&quot;text-anchor&quot;, &quot;end&quot;)
  .attr(&quot;transform&quot;, null)
  .text(function (d) { return d.name; })
.filter(function (d) { return d.x &lt; params.width / 2; })
  .attr(&quot;x&quot;, 6 + sankey.nodeWidth())
  .attr(&quot;text-anchor&quot;, &quot;start&quot;);

// the function for moving the nodes
  function dragmove(d) {
    d3.select(this).attr(&quot;transform&quot;, 
        &quot;translate(&quot; + (
                   d.x = Math.max(0, Math.min(params.width - d.dx, d3.event.x))
                ) + &quot;,&quot; + (
                   d.y = Math.max(0, Math.min(params.height - d.dy, d3.event.y))
                ) + &quot;)&quot;);
        sankey.relayout();
        link.attr(&quot;d&quot;, path);
  }
})();
&lt;/script&gt;
    
    
    &lt;script&gt;
      var cscale = d3.scale.category20b();
      d3.selectAll(&#039;#chart28c6a2e41bc svg path.link&#039;)
        .style(&#039;stroke&#039;, function(d){
          return cscale(d.source.name);
        })
      d3.selectAll(&#039;#chart28c6a2e41bc svg .node rect&#039;)
        .style(&#039;fill&#039;, function(d){
          return cscale(d.name)
        })
        .style(&#039;stroke&#039;, &#039;none&#039;)
    &lt;/script&gt;
        
  &lt;/body&gt;
&lt;/html&gt; ' scrolling='no' frameBorder='0' seamless class='rChart  http://timelyportfolio.github.io/rCharts_d3_sankey/libraries/widgets/d3_sankey  ' id='iframe-chart28c6a2e41bc'> </iframe>
 <style>iframe.rChart{ width: 100%; height: 400px;}</style>
<style>iframe.rChart{ width: 100%; height: 840px;}</style>

## **R** code

### Template objects
Character string objects are defined which are used to fill templates when generating new files for a project.
A tentative default path is also included since this code relates to my own work.


```r
# For package 'rpm'

# data

rmd.template <- "\n\n## Introduction\nADD_TEXT_HERE\n\n### Motivation\nADD_TEXT_HERE\n\n### Details\nADD_TEXT_HERE\n\n#### Capabilities\nADD_TEXT_HERE\n\n#### Limitations\nADD_TEXT_HERE\n\n## Related items\n\n### Files and Data\nADD_TEXT_HERE\n\n### Code flow\nADD_TEXT_HERE\n\n```{r code_sankey, echo=F, eval=T}\n```\n\n```{r code_sankey_embed, echo=F, eval=T, comment=NA, results=\"asis\", tidy=F}\n```\n\n## R code\n\n### Setup\nADD_TEXT_HERE: EXAMPLE\nSetup consists of loading required **R** packages and additional files, preparing any command line arguments for use, and defining functions and other **R** objects.\n\n"

# default path
matt.proj.path <- "C:/github"
```

### Package functions
Functions are defined for creating new projects, generating Rmd files for project **R** scripts,
and appending these **R** Markdown files with updated information from the corresponding **R** scripts as their development continues.
Additional functions will be incorporated later.

#### newProject
`newProject` creates a new named project directory structure at the specified file path.
If a directory with this project name already exists in this location on the file system and `overwrite=FALSE`, the function will abort.
Default project subdirectories are created unless a different vector of folder names is explicitly passed to `newProject`.
If one of the subdirectories is `docs` then the default vector of subdirectories under `docs` is also created.
This argument can also be set explicitly.
The current function only creates directories, not files, so `overwrite=TRUE` is safe to use on any existing project.


```r
newProject <- function(name, path, dirs = c("code", "data", "docs", "plots", 
    "workspaces"), docs.dirs = c("diagrams", "ioslides", "notebook", "Rmd/include", 
    "md", "html", "Rnw", "pdf", "timeline", "tufte"), overwrite = FALSE) {
    
    stopifnot(is.character(name))
    name <- file.path(path, name)
    if (file.exists(name) && !overwrite) 
        stop("This project already exists.")
    dir.create(name, recursive = TRUE, showWarnings = FALSE)
    if (!file.exists(name)) 
        stop("Directory appears invalid.")
    
    path.dirs <- file.path(name, dirs)
    sapply(path.dirs, dir.create, showWarnings = FALSE)
    path.docs <- file.path(name, "docs", docs.dirs)
    if ("docs" %in% dirs) 
        sapply(path.docs, dir.create, recursive = TRUE, showWarnings = FALSE)
    if (overwrite) 
        cat("Project directories updated.\n") else cat("Project directories created.\n")
}
```

#### rmdHeader
`rmdHeader` generates the yaml metadata header for Rmd files as a character string to be inserted at the top of a file.
It has default arguments specific to my own projects but can be changed.
The output from this function is passed directly to `genRmd` below.


```r
rmdHeader <- function(title = "INSERT_TITLE_HERE", author = "Matthew Leonawicz", 
    theme = "united", highlight = "zenburn", toc = FALSE, keep.md = TRUE, ioslides = FALSE, 
    include.pdf = FALSE) {
    if (toc) 
        toc <- "true" else toc <- "false"
    if (keep.md) 
        keep.md <- "true" else keep.md <- "false"
    if (ioslides) 
        hdoc <- "ioslides_presentation" else hdoc <- "html_document"
    rmd.header <- "---\n"
    if (!is.null(title)) 
        rmd.header <- paste0(rmd.header, "title: ", title, "\n")
    if (!is.null(author)) 
        rmd.header <- paste0(rmd.header, "author: ", author, "\n")
    rmd.header <- paste0(rmd.header, "output:\n  ", hdoc, ":\n    toc: ", toc, 
        "\n    theme: ", theme, "\n    highlight: ", highlight, "\n    keep_md: ", 
        keep.md, "\n")
    if (ioslides) 
        rmd.header <- paste0(rmd.header, "    widescreen: true\n")
    if (include.pdf) 
        rmd.header <- paste0(rmd.header, "  pdf_document:\n    toc: ", toc, 
            "\n    highlight: ", highlight, "\n")
    rmd.header <- paste0(rmd.header, "---\n")
    rmd.header
}
```

#### rmdknitrSetup
`rmdknitrSetup` generates the `knitr` global options setup code cunk for Rmd files as a character string to be inserted at the top of a file following the yaml header.
The only option at this time is the ability to include or exclude a source reference to a project-related code flow diagram **R** script via `include.sankey`.
The output from this function is passed directly to `genRmd` below.


```r
rmdknitrSetup <- function(file, include.sankey = TRUE) {
    x <- paste0("\n```{r knitr_setup, echo=FALSE}\nopts_chunk$set(cache=FALSE, eval=FALSE, tidy=TRUE, message=FALSE, warning=FALSE)\n")
    if (include.sankey) 
        x <- paste0(x, "read_chunk(\"../../code/proj_sankey.R\")\n")
    x <- paste0(x, "read_chunk(\"../../code/", file, "\")\n```\n")
    x
}
```

#### genRmd
`genRmd` works on existing projects. It checks for existing **R** scripts.
If no **R** files exist in the project's `code` directory, the function will abort.
Otherwise it will generate Rmd template files for each of the **R** scripts it finds.

With `replace=TRUE` any existing Rmd files are regenerated with the provided template - be careful!
With `replace=FALSE` (default) Rmd files are generated only for **R** scripts which do not yet have corresponding Rmd files.
If `update.header=TRUE`, `replace` is ignored, and only existing Rmd files are regenerated,
in this case strictly updating the yaml metadata header at the top of each Rmd file without altering any other Rmd content/documentation. 

The Rmd files are placed in the `/docs/Rmd` directory.
This function assumes this project directory exists.


```r
genRmd <- function(path, replace = FALSE, header = rmdHeader(), knitrSetupChunk = rmdknitrSetup(), 
    update.header = FALSE, ...) {
    stopifnot(is.character(path))
    files <- list.files(path, pattern = ".R$", full = TRUE)
    stopifnot(length(files) > 0)
    rmd <- gsub(".R", ".Rmd", basename(files))
    rmd <- file.path(dirname(path), "docs/Rmd", rmd)
    if (!(replace | update.header)) 
        rmd <- rmd[!sapply(rmd, file.exists)]
    if (update.header) 
        rmd <- rmd[sapply(rmd, file.exists)]
    stopifnot(length(rmd) > 0)
    
    sinkRmd <- function(x, ...) {
        y1 <- header
        y2 <- kniterSetupChunk
        y3 <- list(...)$rmd.template
        if (is.null(y1)) 
            y1 <- rmd.header
        if (is.null(y2)) 
            y2 <- rmd.knitr.setup(gsub(".Rmd", ".R", basename(x)))
        if (is.null(y3)) 
            y3 <- rmd.template
        sink(x)
        sapply(c(y1, y2, y3), cat)
        sink()
    }
    
    swapHeader <- function(x) {
        l <- readLines(x)
        ind <- which(l == "---")
        l <- l[(ind[2] + 1):length(l)]
        l <- paste0(l, "\n")
        sink(x)
        sapply(c(header, l), cat)
        sink()
    }
    
    if (update.header) {
        sapply(rmd, swapHeader, ...)
        cat("yaml header updated for each .Rmd file.\n")
    } else {
        sapply(rmd, sinkRmd, ...)
        cat(".Rmd files created for each .R file.\n")
    }
}
```

#### chunkNames
`chunkNames` can be used in two ways.
It can return a list with length equal to the number of **R** files,
where each list element is a vector of **R** code chunk names found in each **R** script.

Alternatively, with `append.new=TRUE`, this list has each vector matched element-wise against chunk names found in existing Rmd files.
If no Rmd files have yet been generated, the function will abort.
Otherwise, for the Rmd files which do exist (and this may correspond to a subset of the **R** files),
these Rmd files are appended with a list of code chunk names found in the current corresponding **R** files
which have not yet been integrated into the current state of the Rmd files.
This fascilitates updating of Rmd documentation when it falls behind scripts which have been updated.


```r
chunkNames <- function(path, rChunkID = "# @knitr", rmdChunkID = "```{r", append.new = FALSE) {
    files <- list.files(path, pattern = ".R$", full = TRUE)
    stopifnot(length(files) > 0)
    l1 <- lapply(files, readLines)
    l1 <- rapply(l1, function(x) x[substr(x, 1, nchar(rChunkID)) == rChunkID], 
        how = "replace")
    l1 <- rapply(l1, function(x, p) gsub(paste0(p, " "), "", x), how = "replace", 
        p = rChunkID)
    if (!append.new) 
        return(l1)
    
    appendRmd <- function(x, rmd.files, rChunks, rmdChunks, ID) {
        r1 <- rmdChunks[[x]]
        r2 <- rChunks[[x]]
        r.new <- r2[!(r2 %in% r1)]
        if (length(r.new)) {
            r.new <- paste0(ID, " ", r.new, "}\n```\n", collapse = "")  # Hard coded brace and backticks
            sink(rmd.files[x], append = TRUE)
            cat("\nNEW_CODE_CHUNKS\n")
            cat(r.new)
            sink()
            paste(basename(rmd.files[x]), "appended with new chunk names from .R file")
        } else paste("No new chunk names appended to", basename(rmd.files[x]))
    }
    
    rmd <- gsub(".R", ".Rmd", basename(files))
    rmd <- file.path(dirname(path), "docs/Rmd", rmd)
    rmd <- rmd[sapply(rmd, file.exists)]
    stopifnot(length(rmd) > 0)  # Rmd files must exist
    files.ind <- match(gsub(".Rmd", "", basename(rmd)), gsub(".R", "", basename(files)))  # Rmd exist for which R script
    l2 <- lapply(rmd, readLines)
    l2 <- rapply(l2, function(x) x[substr(x, 1, nchar(rmdChunkID)) == rmdChunkID], 
        how = "replace")
    l2 <- rapply(l2, function(x, p) gsub(paste0(p, " "), "", x), how = "replace", 
        p = gsub("\\{", "\\\\{", rmdChunkID))
    l2 <- rapply(l2, function(x) gsub("}", "", sapply(strsplit(x, ","), "[[", 
        1)), how = "replace")
    sapply(1:length(rmd), appendRmd, rmd.files = rmd, rChunks = l1[files.ind], 
        rmdChunks = l2, ID = rmdChunkID)
}
```

Regarding the creation and updating of Rmd files, `rpm` simply assumes that there will be one **R** Markdown file corresponding to one **R** script.
This is not always the case for a given project, but again, the purpose is to generate basic templates.
Unnecessary files can always be deleted later, or edits made such that one **R** Markdown file reads multiple **R** scripts,
as is the case with the Rmd file used to generate this document.

#### convertDocs
`convertDocs` converts between Rmd and Rnw files.
The project's `docs/Rmd` or `docs/Rnw` directory is specified.
Any files of the same type as the directory are converted to the other type and saved to the other directory.
The input files are not removed.

This function speeds up the process of duplicating files, e.g., when wanting to make PDFs from Rnw files when only Rmd files exist.
This is almost exclusively what I use this function for.
On less frequent occasions I have used it in the other direction when I have Rnw files which were once used to make PDFs but later I decide to put them on the web as a web page and not as a link to a PDF.

The user still makes specific changes by hand, for example, any required changes to `knitr` code chunk options that must differ for PDF output vs. html output.
The primary benefit is in not having to fuss with large amounts of standard substitutions which can be automated, such as swapping code chunk enclosure styles and common file metadata.
Of course, this function is not perfect.
It amounts to a text-parsing hack that is intended to handle the most common of idiosyncrasies and differences which exist between my own Rmd and Rnw files in the context of my own set of rules and assumptions, outlined below.


```r
# Rmd <-> Rnw document conversion Conversion support functions Main
# conversion function
convertDocs <- function(path, rmdChunkID = c("```{r", "}", "```"), rnwChunkID = c("<<", 
    ">>=", "@"), emphasis = "replace", overwrite = FALSE, ...) {
    stopifnot(is.character(path))
    type <- basename(path)
    rmd.files <- list.files(path, pattern = ".Rmd$", full = TRUE)
    rnw.files <- list.files(path, pattern = ".Rnw$", full = TRUE)
    dots <- list(...)
    if (rmdChunkID[1] == "```{r") 
        rmdChunkID[1] <- paste0(rmdChunkID[1], " ")
    gsbraces <- function(txt) gsub("\\{", "\\\\{", txt)
    if (type == "Rmd") {
        stopifnot(length(rmd.files) > 0)
        outDir <- file.path(dirname(path), "Rnw")
        if (is.null(doc.class <- dots$doc.class)) 
            doc.class <- "article"
        if (is.null(doc.packages <- dots$doc.packages)) 
            doc.packages <- "geometry"
        doc.class.string <- paste0("\\documentclass{", doc.class, "}")
        doc.packages.string <- paste0(sapply(doc.packages, function(x) paste0("\\usepackage{", 
            x, "}")), collapse = "\n")
        if ("geometry" %in% doc.packages) 
            doc.packages.string <- c(doc.packages.string, "\\geometry{verbose, tmargin=2.5cm, bmargin=2.5cm, lmargin=2.5cm, rmargin=2.5cm}")
        header.rnw <- c(doc.class.string, doc.packages.string, "\\begin{document}\n")  #,
        # paste0('<<highlight, echo=FALSE>>=\nknit_theme$set(knit_theme$get('',
        # theme, ''))\n@\n'))
    } else if (type == "Rnw") {
        stopifnot(length(rnw.files) > 0)
        outDir <- file.path(dirname(path), "Rmd")
    } else stop("path must end in 'Rmd' or 'Rnw'.")
    
    swapHeadings <- function(from, to, x) {
        nc <- nchar(x)
        ind <- which(substr(x, 1, 8) == "\\section" | substr(x, 1, 4) == "\\sub")
        if (!length(ind)) {
            # assume Rmd file
            ind <- which(substr(x, 1, 1) == "#")
            ind.n <- rep(1, length(ind))
            for (i in 2:6) {
                ind.tmp <- which(substr(x[ind], 1, i) == substr("######", 1, 
                  i))
                if (length(ind.tmp)) 
                  ind.n[ind.tmp] <- ind.n[ind.tmp] + 1 else break
            }
            for (i in 1:length(ind)) {
                n <- ind.n[i]
                input <- paste0(substr("######", 1, n), " ")
                h <- x[ind[i]]
                h <- gsub("\\*", "_", h)  # Switch any markdown boldface asterisks in headings to double underscores
                heading <- gsub("\n", "", substr(h, n + 2, nc[ind[i]]))
                # h <- gsub(input, '', h)
                if (n <= 2) 
                  subs <- "\\" else if (n == 3) 
                  subs <- "\\sub" else if (n == 4) 
                  subs <- "\\subsub" else if (n >= 5) 
                  subs <- "\\subsubsub"
                output <- paste0("\\", subs, "section{", heading, "}\n")
                x[ind[i]] <- gsub(h, output, h)
            }
        } else {
            # assume Rnw file
            ind <- which(substr(x, 1, 8) == "\\section")
            if (length(ind)) {
                for (i in 1:length(ind)) {
                  h <- x[ind[i]]
                  heading <- paste0("## ", substr(h, 10, nchar(h) - 2))
                  x[ind[i]] <- gsub(gsbraces(h), heading, h)
                }
            }
            ind <- which(substr(x, 1, 4) == "\\sub")
            if (length(ind)) {
                for (i in 1:length(ind)) {
                  h <- x[ind[i]]
                  z <- substr(h, 2, 10)
                  if (z == "subsubsub") {
                    p <- "##### "
                    n <- 18
                  } else if (substr(z, 1, 6) == "subsub") {
                    p <- "#### "
                    n <- 15
                  } else if (substr(z, 1, 3) == "sub") {
                    p <- "### "
                    n <- 12
                  }
                  heading <- paste0(p, substr(h, n, nchar(h) - 2))
                  x[ind[i]] <- gsub(gsbraces(h), heading, h)
                }
            }
        }
        x
    }
    
    swapChunks <- function(from, to, x) {
        nc <- nchar(x)
        chunk.start.open <- substr(x, 1, nchar(from[1])) == from[1]
        chunk.start.close <- substr(x, nc - 1 - nchar(from[2]) + 1, nc - 1) == 
            from[2]
        chunk.start <- which(chunk.start.open & chunk.start.close)
        chunk.end <- which(substr(x, 1, nchar(from[3])) == from[3] & nc == nchar(from[3]) + 
            1)
        x[chunk.start] <- gsub(from[2], to[2], gsub(gsbraces(from[1]), gsbraces(to[1]), 
            x[chunk.start]))
        x[chunk.end] <- gsub(from[3], to[3], x[chunk.end])
        chunklines <- as.numeric(unlist(mapply(seq, chunk.start, chunk.end)))
        list(x, chunklines)
    }
    
    # I know I use '**' strictly for bold font in Rmd files.  For now, this
    # function assumes: 1. The only emphasis in a doc is boldface or typewriter.
    # 2. These instances are always preceded by a space, a carriage return, or
    # an open bracket, 3. and followed by a space, period, comma, or closing
    # bracket.
    swapEmphasis <- function(x, emphasis = "remove", pat.remove = c("`", "\\*\\*", 
        "__"), pat.replace = pat.remove, replacement = c("\\\\texttt\\{", "\\\\textbf\\{", 
        "\\\\textbf\\{", "\\}", "\\}", "\\}")) {
        
        stopifnot(emphasis %in% c("remove", "replace"))
        n <- length(pat.replace)
        rep1 <- replacement[1:n]
        rep2 <- replacement[(n + 1):(2 * n)]
        prefix <- c(" ", "^", "\\{", "\\(")
        suffix <- c(" ", ",", "-", "\n", "\\.", "\\}", "\\)")
        n.p <- length(prefix)
        n.s <- length(suffix)
        pat.replace <- c(paste0(rep(prefix, n), rep(pat.replace, each = n.p)), 
            paste0(rep(pat.replace, each = n.s), rep(suffix, n)))
        replacement <- c(paste0(rep(gsub("\\^", "", prefix), n), rep(rep1, each = n.p)), 
            paste0(rep(rep2, each = n.s), rep(suffix, n)))
        if (emphasis == "remove") 
            for (k in 1:length(pat.remove)) x <- sapply(x, function(v, p, r) gsub(p, 
                r, v), p = pat.remove[k], r = "")
        if (emphasis == "replace") 
            for (k in 1:length(pat.replace)) x <- sapply(x, function(v, p, r) gsub(p, 
                r, v), p = pat.replace[k], r = replacement[k])
        x
    }
    
    swap <- function(file, header = NULL, outDir, ...) {
        title <- list(...)$title
        author <- list(...)$author
        highlight <- list(...)$highlight
        ext <- tail(strsplit(file, "\\.")[[1]], 1)
        l <- readLines(file)
        l <- l[substr(l, 1, 7) != "<style>"]  # Strip any html style lines
        if (ext == "Rmd") {
            hl.default <- "solarized-light"
            out.ext <- "Rnw"
            h.ind <- 1:which(l == "---")[2]
            h <- l[h.ind]
            t.ind <- which(substr(h, 1, 7) == "title: ")
            a.ind <- which(substr(h, 1, 8) == "author: ")
            highlight.ind <- which(substr(h, 1, 11) == "highlight: ")
            if (is.null(title) & length(t.ind)) 
                title <- substr(h[t.ind], 8, nchar(h[t.ind])) else if (is.null(title)) 
                title <- ""
            if (is.null(author) & length(a.ind)) 
                author <- substr(h[a.ind], 9, nchar(h[a.ind])) else if (is.null(author)) 
                author <- ""
            if (is.null(highlight) & length(highlight.ind)) 
                highlight <- substr(h[highlight.ind], 12, nchar(h[highlight.ind])) else if (is.null(highlight)) 
                highlight <- hl.default else if (!(highlight %in% knit_theme$get())) 
                highlight <- hl.default
            if (!is.null(title)) 
                header <- c(header, paste0("\\title{", title, "}"))
            if (!is.null(author)) 
                header <- c(header, paste0("\\author{", author, "}"))
            if (!is.null(title)) 
                header <- c(header, "\\maketitle\n")
            header <- c(header, paste0("<<highlight, echo=FALSE>>=\nknit_theme$set(knit_theme$get('", 
                highlight, "'))\n@\n"))
        } else if (ext == "Rnw") {
            hl.default <- "tango"
            out.ext <- "Rmd"
            begin.doc <- which(l == "\\begin{document}")
            make.title <- which(l == "\\maketitle")
            if (length(make.title)) 
                h.ind <- 1:make.title else h.ind <- 1:begin.doc
            h <- l[h.ind]
            t.ind <- which(substr(h, 1, 6) == "\\title")
            a.ind <- which(substr(h, 1, 7) == "\\author")
            highlight.ind <- which(substr(l, 1, 11) == "<<highlight")
            if (is.null(title) & length(t.ind)) 
                title <- substr(h[t.ind], 8, nchar(h[t.ind]) - 1)
            if (is.null(author) & length(a.ind)) 
                author <- substr(h[a.ind], 9, nchar(h[a.ind]) - 1)
            if (length(highlight.ind)) {
                l1 <- l[highlight.ind + 1]
                h1 <- substr(l1, nchar("knit_theme$set(knit_theme$get('") + 
                  1, nchar(l1) - nchar("'))\n"))
                if (!(h1 %in% knit_theme$get())) 
                  h1 <- hl.default
            }
            if (is.null(highlight) & length(highlight.ind)) 
                highlight <- h1 else if (is.null(highlight)) 
                highlight <- hl.default else if (!(highlight %in% knit_theme$get())) 
                highlight <- hl.default
            header <- rmdHeader(title = title, author = author, highlight = highlight)
        }
        header <- paste0(header, collapse = "\n")
        l <- paste0(l[-h.ind], "\n")
        if (ext == "Rmd") {
            from <- rmdChunkID
            to <- rnwChunkID
        }
        if (ext == "Rnw") {
            from <- rnwChunkID
            to <- rmdChunkID
        }
        l <- swapHeadings(from = from, to = to, x = l)
        chunks <- swapChunks(from = from, to = to, x = l)
        l <- chunks[[1]]
        if (ext == "Rmd") 
            l <- swapEmphasis(x = l, emphasis = emphasis)
        if (ext == "Rmd") 
            l[-chunks[[2]]] <- sapply(l[-chunks[[2]]], function(v, p, r) gsub(p, 
                r, v), p = "_", r = "\\\\_")
        l <- c(header, l, "\n\\end{document}\n")
        outfile <- file.path(outDir, gsub(paste0("\\.", ext), paste0("\\.", 
            out.ext), basename(file)))
        if (overwrite || !file.exists(outfile)) {
            sink(outfile)
            sapply(l, cat)
            sink()
            print(paste("Writing", outfile))
        }
    }
    
    if (type == "Rmd") {
        sapply(rmd.files, swap, header = header.rnw, outDir = outDir, ...)
        cat(".Rmd to .Rnw file conversion complete.\n")
    } else {
        sapply(rnw.files, swap, header = NULL, outDir = outDir, ...)
        cat(".Rnw to .Rmd file conversion complete.\n")
    }
}
```

#### moveDocs
`moveDocs` relocates files by renaming with a new file path.
Specifically, it scans for md and html files in the `docs/Rmd` directory and/or pdf files in the `docs/Rnw` directory.
If such files are found in the respective locations, they are moved to `docs/md`, `docs/html`, and `docs/pdf`, respectively.

The intent is to clean up the Rmd and Rnw directories after `knitr` has been used to knit documents in place.
I do this because I have more success knitting documents with the confluence of `RStudio`, `rmarkdown`, `knitr`, `pandoc`, and `LaTeX` when the knitting occurs all within the directory of the originating files.
The process is more prone to throwing errors when trying to specify alternate locations for outputs.

`moveDocs` makes a nominal effort to replace a possible relative path with a full file path before proceeding, if the former is supplied.
Default arguments include `move=TRUE` which will call `file.rename` and `copy=FALSE` which, if `TRUE` (and `move=FALSE`), will alternatively call `file.copy`.
If both are `TRUE`, any files found are moved.

This function will always overwrite any existing file versions previously moved to the output directories, by way of `file.rename`.
To keep the behavior consistent, when `move=FALSE` and `copy=TRUE`, `file.copy` always executes with its argument, `overwrite=TRUE`.
This should never cause problems because in the context I intend for this function,
the types of files being moved or copied from `docs/Rmd` and `docs/Rnw` are never used as inputs to other files, functions, or processes,
nor are they meant to be edited by hand after being generated.

If there are LaTeX-associated files present (.TeX, .aux, and .txt files with the same file names as local pdf files.),
these files will be removed if `remove.latex=TRUE` (default).
If `FALSE`, the default `latexDir="LaTeX"` means that these files will be moved to the `docs/LaTeX` directory rather than deleted.
If this directory does not exist, it will be created.
An alternate location can be specified, such as "pdf" if you want to keep these files with the related pdf files after those are moved by `moveDocs` as well to `docs/pdf`.


```r
# Organization documentation
moveDocs <- function(path.docs, type = c("md", "html", "pdf"), move = TRUE, 
    copy = FALSE, remove.latex = TRUE, latexDir = "latex") {
    if (any(!(type %in% c("md", "html", "pdf")))) 
        stop("type must be among 'md', 'html', and 'pdf'")
    stopifnot(move | copy)
    if (path.docs == "." | path.docs == "./") 
        path.docs <- getwd()
    if (strsplit(path.docs, "/")[[1]][1] == "..") {
        tmp <- strsplit(path.docs, "/")[[1]][-1]
        if (length(tmp)) 
            path.docs <- file.path(getwd(), paste0(tmp, collapse = "/")) else stop("Check path.docs argument.")
    }
    for (i in 1:length(type)) {
        if (type[i] == "pdf") 
            origin <- "Rnw" else origin <- "Rmd"
        path.i <- file.path(path.docs, origin)
        infiles <- list.files(path.i, pattern = paste0("\\.", type[i], "$"), 
            full = TRUE)
        if (type[i] == "pdf") {
            extensions <- c("tex", "aux", "log")
            all.pdfs <- basename(list.files(path.docs, pattern = ".pdf$", full = T, 
                recursive = T))
            pat <- paste0("^", rep(gsub("pdf", "", all.pdfs), length(extensions)), 
                rep(extensions, each = length(all.pdfs)), "$")
            latex.files <- unlist(sapply(1:length(pat), function(p, path, pat) list.files(path, 
                pattern = pat[p], full = TRUE), path = path.i, pat = pat))
            print(latex.files)
            if (length(latex.files)) {
                if (remove.latex) {
                  unlink(latex.files)
                } else {
                  dir.create(file.path(path.docs, latexDir), showWarnings = FALSE, 
                    recursive = TRUE)
                  file.rename(latex.files, file.path(path.docs, latexDir, basename(latex.files)))
                }
            }
        }
        if (length(infiles)) {
            infiles <- infiles[basename(dirname(infiles)) == origin]
            if (length(infiles)) {
                if (type[i] == "html") {
                  html.dirs <- gsub("\\.html", "_files", infiles)
                  dirs <- list.dirs(path.i, recursive = FALSE)
                  ind <- which(dirs %in% html.dirs)
                  if (length(ind)) {
                    html.dirs <- dirs[ind]
                    html.dirs.recur <- list.dirs(html.dirs)
                    for (p in 1:length(html.dirs.recur)) dir.create(gsub("/Rmd", 
                      "/html", html.dirs.recur[p]), recursive = TRUE, showWarnings = FALSE)
                    subfiles <- unique(unlist(lapply(1:length(html.dirs.recur), 
                      function(p, path) list.files(path[p], full = TRUE), path = html.dirs.recur)))
                    subfiles <- subfiles[!(subfiles %in% html.dirs.recur)]
                    file.copy(subfiles, gsub("/Rmd", "/html", subfiles), overwrite = TRUE)
                    if (move) 
                      unlink(html.dirs, recursive = TRUE)
                  }
                }
                outfiles <- file.path(path.docs, type[i], basename(infiles))
                if (move) 
                  file.rename(infiles, outfiles) else if (copy) 
                  file.copy(infiles, outfiles, overwrite = TRUE)
            }
        }
    }
}
```

#### genNavbar

`genNavbar` generates a navigation bar for a web page.
The html file created is generally written to the project's `docs/Rmd/include` directory.
However, if this function is used to create a navbar for a Github user web page, the html file should be stored in a sensible location inside the user pages repository, e.g., `leonawicz.github.io/assets`.

The common navigation bar html is included at the beginning of the body of the html for each web page in the project's website.
`menu` is a vector of names for each dropdown menu.
`submenus` is a list of vectors of menu options corresponding to each menu.
`files` is a similar list of vectors.
Each element is either an html file for a web page to be associated with the submenu link,
"header" to indicate the corresponding name in `submenus` is only a group label and not a link to a web page,
or "divider" to indicate placement of a bar for separating groups in a dropdown menu.

`theme` can be either `united` (default) or `cyborg`.
Both are from Bootswatch.
The function must apply some internal differentiation in the construction of the html navigation bar between themes.
This is currently the only `rpm` function which attempts to handle multiple Bootswatch themes with different CSS tags.


```r
# Functions for Github project websites
genNavbar <- function(htmlfile = "navbar.html", title, menu, submenus, files, 
    title.url = "index.html", home.url = "index.html", site.url = "", site.name = "Github", 
    theme = "united", include.home = FALSE) {
    if (!(theme %in% c("united", "cyborg"))) 
        stop("Only the following themes supported: united, cyborg.")
    
    navClassStrings <- function(x) {
        switch(x, united = c("brand", "nav-collapse collapse", "nav", "nav pull-right", 
            "navbar-inner", "container", "", "btn btn-navbar", ".nav-collapse", 
            "</div>\n"), cyborg = c("navbar-brand", "navbar-collapse collapse navbar-responsive-collapse", 
            "nav navbar-nav", "nav navbar-nav navbar-right", "container", "navbar-header", 
            "      </div>\n", "navbar-toggle", ".nav-collapse", ""))
    }
    
    ncs <- navClassStrings(theme)
    
    fillSubmenu <- function(x, name, file, theme) {
        if (theme == "united") 
            dd.menu.header <- "nav-header" else if (theme == "cyborg") 
            dd.menu.header <- "dropdown-header"
        if (file[x] == "divider") 
            return("              <li class=\"divider\"></li>\n")
        if (file[x] == "header") 
            return(paste0("              <li class=\"", dd.menu.header, "\">", 
                name[x], "</li>\n"))
        paste0("              <li><a href=\"", file[x], "\">", name[x], "</a></li>\n")
    }
    
    fillMenu <- function(x, menu, submenus, files, theme) {
        m <- menu[x]
        gs.menu <- gsub(" ", "-", tolower(m))
        s <- submenus[[x]]
        f <- files[[x]]
        if (s[1] == "empty") {
            y <- paste0("<li><a href=\"", f, "\">", m, "</a></li>\n")
        } else {
            y <- paste0("<li class=\"dropdown\">\n            <a href=\"", gs.menu, 
                "\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">", m, 
                " <b class=\"caret\"></b></a>\n            <ul class=\"dropdown-menu\">\n", 
                paste(sapply(1:length(s), fillSubmenu, name = s, file = f, theme = theme), 
                  sep = "", collapse = ""), "            </ul>\n", collapse = "")
        }
    }
    
    if (include.home) 
        home <- paste0("<li><a href=\"", home.url, "\">Home</a></li>\n          ") else home <- ""
    x <- paste0("<div class=\"navbar navbar-default navbar-fixed-top\">\n  <div class=\"", 
        ncs[5], "\">\n    <div class=\"", ncs[6], "\">\n      <button type=\"button\" class=\"", 
        ncs[8], "\" data-toggle=\"collapse\" data-target=\"", ncs[9], "\">\n        <span class=\"icon-bar\"></span>\n        <span class=\"icon-bar\"></span>\n        <span class=\"icon-bar\"></span>\n      </button>\n      <a class=\"", 
        ncs[1], "\" href=\"", title.url, "\">", title, "</a>\n", ncs[7], "      <div class=\"", 
        ncs[2], "\">\n        <ul class=\"", ncs[3], "\">\n          ", home, 
        paste(sapply(1:length(menu), fillMenu, menu = menu, submenus = submenus, 
            files = files, theme = theme), sep = "", collapse = "\n          "), 
        "        </ul>\n        <ul class=\"", ncs[4], "\">\n          <a class=\"btn btn-primary\" href=\"", 
        site.url, "\">\n            <i class=\"fa fa-github fa-lg\"></i>\n            ", 
        site.name, "\n          </a>\n        </ul>\n      </div><!--/.nav-collapse -->\n    </div>\n  ", 
        ncs[10], "</div>\n", collpase = "")
    sink(htmlfile)
    cat(x)
    sink()
    x
}
```

#### genOutyaml

`genOutyaml` generates the `_out.yaml` file for yaml front-matter common to all html files in the project website.
The file should be written to the project's `docs/Rmd` directory.
`lib` specifies the library directory for any associated files.
yaml `includes` for external html common to all project web pages in the site can also be specified with `header`, `before_body`, and `after_body`.
These can be specified by file basename only (no path) and the function assumes these files are in the `docs/Rmd/include` directory.
At this time all external libraries must be provided by the user, for example in `docs/Rmd/libs`.
It is recommended. See the project repo [gh-pages](https://github.com/leonawicz/ProjectManagement/tree/gh-pages "gh-pages") branch for an example.


```r
genOutyaml <- function(file, theme = "cosmo", highlight = "zenburn", lib = NULL, 
    header = NULL, before_body = NULL, after_body = NULL) {
    output.yaml <- paste0("html_document:\n  self_contained: false\n  theme: ", 
        theme, "\n  highlight: ", highlight, "\n  mathjax: null\n  toc_depth: 2\n")
    if (!is.null(lib)) 
        output.yaml <- paste0(output.yaml, "  lib_dir: ", lib, "\n")
    output.yaml <- paste0(output.yaml, "  includes:\n")
    if (!is.null(header)) 
        output.yaml <- paste0(output.yaml, "    in_header: ", header, "\n")
    if (!is.null(before_body)) 
        output.yaml <- paste0(output.yaml, "    before_body: ", before_body, 
            "\n")
    if (!is.null(after_body)) 
        output.yaml <- paste0(output.yaml, "    after_body: ", after_body, "\n")
    sink(file)
    cat(output.yaml)
    sink()
    output.yaml
}
```

#### genAppDiv

`genAppDiv` generates an html file storing a container div element which organizes Shiny web applications.
The function scans a directory of Shiny app subdirectories.
This apps directory should be a local repository.

Specifically, `genAppDiv` looks for a named directory of image files.
There should be one image per app, named exactly as the respective app directory is named.
Only apps with corresponding images are built into the html container.
If you wish to leave out, say, a developmental app from being linked to on you Github user website, do not include an image file for that app.

The container element includes an image link to each app's url as well as a link to the source code on Github.
Although the function scans for images in directory inside a local repository, the images referenced in the output html are of course not local.
They point to the same images stored on Github, hence why it is useful for the local directory of apps to be a Github repository.
As an example, a repository may contain the directories, `app1`, `app2`, `app3`, and `images`.

This function will probably be removed in favor of the more general `genPanelDiv` function.



```r
# Functions for Github user website
genAppDiv <- function(file = "C:/github/leonawicz.github.io/assets/apps_container.html", 
    type = "apps", main = "Shiny Apps", apps.url = "http://shiny.snap.uaf.edu", 
    github.url = "https://github.com/ua-snap/shiny-apps/tree/master", apps.dir = "C:/github/shiny-apps", 
    img.loc = "_images/cropped", ...) {
    
    apps.img <- list.files(file.path(apps.dir, img.loc))
    apps <- sapply(strsplit(apps.img, "\\."), "[[", 1)
    x <- paste0("<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-lg-12\">\n      <div class=\"page-header\">\n        <h3 id=\"", 
        type, "\">", main, "</h3>\n      </div>\n    </div>\n  </div>\n  ")
    
    fillRow <- function(i, ...) {
        app <- apps[i]
        app.url <- file.path(apps.url, app)
        dots <- list(...)
        if (is.null(dots$col)) 
            col <- "warning" else col <- dots$col
        if (is.null(dots$panel.main)) 
            panel.main <- gsub("_", " ", app) else panel.main <- dots$panel.main
        if (length(panel.main) > 1) 
            panel.main <- panel.main[i]
        x <- paste0("<div class=\"col-lg-4\">\n\t\t  <div class=\"bs-component\">\n\t\t\t<div class=\"panel panel-", 
            col, "\">\n\t\t\t  <div class=\"panel-heading\"><h3 class=\"panel-title\">", 
            panel.main, "</h3>\n\t\t\t  </div>\n\t\t\t  <div class=\"panel-body\"><a href=\"", 
            app.url, "\" target=\"_blank\"><img src=\"", file.path(gsub("/tree/", 
                "/raw/", github.url), img.loc, apps.img[i]), "\" alt=\"", apps[i], 
            "\" width=100% height=200px></a><p></p>\n\t\t\t\t<div class=\"btn-group btn-group-justified\">\n\t\t\t\t  <a href=\"", 
            app.url, "\" target=\"_blank\" class=\"btn btn-success\">Launch</a>\n\t\t\t\t  <a href=\"", 
            file.path(github.url, app), "\" target=\"_blank\" class=\"btn btn-info\">Github</a>\n\t\t\t\t</div>\n\t\t\t  </div>\n\t\t\t</div>\n\t\t  </div>\n\t\t</div>")
    }
    
    n <- length(apps)
    seq1 <- seq(1, n, by = 3)
    y <- c()
    for (j in 1:length(seq1)) {
        ind <- seq1[j]:(seq1[j] + 2)
        ind <- ind[ind %in% 1:n]
        y <- c(y, paste0("<div class=\"row\">\n", paste0(sapply(ind, fillRow, 
            ...), collapse = "\n"), "</div>\n"))
    }
    z <- "</div>\n"
    sink(file)
    sapply(c(x, y, z), cat)
    sink()
    cat("div container html created for Shiny Apps.\n")
}
```

#### genPanelDiv

`genPanelDiv` generates an html file storing a container div element which in its current state of development organizes two types of content: **R** projects and Shiny web applications.

The `type` argument can be either `projects` or `apps` and essentially bifurcates the behavior of `genPanelDiv`.
The purpose of the function is to generate an html file defining a container div element to display and reference either my **R** projects or my Shiny apps.

For projects, the function scans a directory of local repositories and takes any directories found to be the names of projects.
There is an `exclude` argument for dropping any known directories that are to be avoided.
My defaults are `exclude="leonawicz.github.io", "shiny-apps"` since the first is just a local repository for my Github user account web site and not a "project" in the same sense of my other projects
and the second is the local repository which is scanned by `genPanelDiv` when `type="apps"`.

For apps, the function scans a directory of Shiny app subdirectories.
Unlike for projects, where `genPanelDiv` scans a directory of multiple local repositories, this apps directory should be a specific local repository. The apps contained within are not inndividual repositories.
I have taken this approach for now simply because this is how my apps tend to be stored.

Specifically, the `genAppDiv` looks for a named directory of image files.
There should be one image per app, named exactly as the respective app directory is named.
Only apps with corresponding images are built into the html container.
If you wish to leave out, say, a developmental app from being linked to on you Github user website, do not include an image file for that app.

The container element includes an image link to each app's url as well as a link to the source code on Github.
Although the app scans for images in a local repository, the images referenced in the output html are of course not local.
They point to the same images stored on Github, hence why it is useful for the local directory of apps to be a Github repository.

This function makes the more specific `genAppDiv` redundant and will likely replace it.


```r
genPanelDiv <- function(outDir, type = "projects", main = "Projects", github.user = "leonawicz", 
    prjs.dir = "C:/github", exclude = c("leonawicz.github.io", "shiny-apps"), 
    img.loc = "_images/cropped", ...) {
    stopifnot(github.user %in% c("leonawicz", "ua-snap"))
    if (type == "apps") {
        filename <- "apps_container.html"
        web.url <- "http://shiny.snap.uaf.edu"
        gh.url.tail <- "shiny-apps/tree/master"
        target <- " target=\"_blank\""
        go.label <- "Launch"
        prjs.dir <- file.path(prjs.dir, "shiny-apps")
        prjs.img <- list.files(file.path(prjs.dir, img.loc))
        prjs <- sapply(strsplit(prjs.img, "\\."), "[[", 1)
    }
    if (type == "projects") {
        filename <- "projects_container.html"
        web.url <- paste0("http://", github.user, ".github.io")
        gh.url.tail <- ""
        target <- ""
        go.label <- "Website"
        prjs <- list.dirs(prjs.dir, full = TRUE, recursive = FALSE)
        prjs <- prjs[!(basename(prjs) %in% exclude)]
        prjs.img <- sapply(1:length(prjs), function(i, a) list.files(file.path(a[i], 
            "plots"), pattern = paste0("^_", basename(a)[i])), a = prjs)
        prjs <- basename(prjs)
    }
    gh.url <- file.path("https://github.com", github.user, gh.url.tail)
    x <- paste0("<div class=\"container\">\n  <div class=\"row\">\n    <div class=\"col-lg-12\">\n      <div class=\"page-header\">\n        <h3 id=\"", 
        type, "\">", main, "</h3>\n      </div>\n    </div>\n  </div>\n  ")
    
    fillRow <- function(i, ...) {
        prj <- prjs[i]
        if (type == "apps") 
            img.src <- file.path(gsub("/tree/", "/raw/", gh.url), img.loc, prjs.img[i])
        if (type == "projects") 
            img.src <- file.path(gh.url, prj, "raw/master/plots", prjs.img[i])
        web.url <- file.path(web.url, prj)
        dots <- list(...)
        if (is.null(dots$col)) 
            col <- "warning" else col <- dots$col
        if (is.null(dots$panel.main)) 
            panel.main <- gsub("_", " ", prj) else panel.main <- dots$panel.main
        if (length(panel.main) > 1) 
            panel.main <- panel.main[i]
        x <- paste0("<div class=\"col-lg-4\">\n\t\t  <div class=\"bs-component\">\n\t\t\t<div class=\"panel panel-", 
            col, "\">\n\t\t\t  <div class=\"panel-heading\"><h3 class=\"panel-title\">", 
            panel.main, "</h3>\n\t\t\t  </div>\n\t\t\t  <div class=\"panel-body\"><a href=\"", 
            web.url, "\"", target, "><img src=\"", img.src, "\" alt=\"", prj, 
            "\" width=100% height=200px></a><p></p>\n\t\t\t\t<div class=\"btn-group btn-group-justified\">\n\t\t\t\t  <a href=\"", 
            web.url, "\"", target, " class=\"btn btn-success\">", go.label, 
            "</a>\n\t\t\t\t  <a href=\"", file.path(gh.url, prj), "\" class=\"btn btn-info\">Github</a>\n\t\t\t\t</div>\n\t\t\t  </div>\n\t\t\t</div>\n\t\t  </div>\n\t\t</div>")
    }
    
    n <- length(prjs)
    seq1 <- seq(1, n, by = 3)
    y <- c()
    for (j in 1:length(seq1)) {
        ind <- seq1[j]:(seq1[j] + 2)
        ind <- ind[ind %in% 1:n]
        y <- c(y, paste0("<div class=\"row\">\n", paste0(sapply(ind, fillRow, 
            ...), collapse = "\n"), "</div>\n"))
    }
    z <- "</div>\n"
    sink(file.path(outDir, filename))
    sapply(c(x, y, z), cat)
    sink()
    cat("div container html file created.\n")
}
```

#### htmlHead

`htmlHead` .



```r
htmlHead <- function(author = "Matthew Leonawicz", title = author, script.paths = NULL, 
    stylesheet.paths, stylesheet.args = vector("list", length(path.stylesheets)), 
    ...) {
    x <- paste0("<!DOCTYPE html>\n\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n\n<head>\n\n<meta charset=\"utf-8\">\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n\n<meta name=\"author\" content=", 
        author, " />\n\n<title>", title, "</title>\n")
    
    if (is.character(script.paths)) 
        x <- c(x, paste0(paste0("<script src=\"", script.paths, "\"></script>", 
            collapse = "\n"), "\n"))
    
    x <- c(x, "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n")
    
    if (is.character(stylesheet.paths)) {
        n <- length(stylesheet.paths)
        stopifnot(is.list(stylesheet.args))
        stopifnot(length(stylesheet.args) == n)
        for (i in 1:n) {
            string <- ""
            if (is.list(stylesheet.args[i])) {
                v <- stylesheet.args[i]
                arg <- names(v)
                if (is.character(arg) && all(arg != "")) 
                  string <- paste0(" ", paste(arg, paste0("\"", v, "\""), sep = "=", 
                    collapse = " "))
            }
            x <- c(x, paste0("<link rel=\"stylesheet\" href=\"", stylesheet.paths[i], 
                "\"", string, ">\n"))
        }
    }
    
    x <- c(x, "</head>\n")
    x
    
}
```

#### htmlBodyTop

`htmlBodyTop` .



```r
htmlBodyTop <- function(css.file = NULL, css.string = NULL, background.image = "", 
    include.default = TRUE, ...) {
    x <- "<style type = \"text/css\">\n"
    
    default <- paste0("\n\t.main-container {\n\t  max-width: 940px;\n\t  margin-left: auto;\n\t  margin-right: auto;\n\n\t}\n\n\tbody {\n\t  background-image: url(\"", 
        background.image, "\");\n\t  background-attachment: fixed;\n\t  background-size: 1920px 1080px;\n\t}\n\t\n\t/* padding for bootstrap navbar */\n\tbody {\n\t  padding-top: 50px;\n\t  padding-bottom: 40px;\n\t}\n\t@media (max-width: 979px) {\n\t  body {\n\t\tpadding-top: 0;\n\t  }\n\t}\n\t\n\t.nav>.btn {\n\t  line-height: 0.75em;\n\t  margin-top: 9px;\n\t}\n\t")
    
    if (!is.null(css.file)) 
        y <- readLines(css.file) else y <- ""
    if (!is.null(css.string)) 
        y <- c(y, css.string)
    if (include.default) 
        y <- c(default, y)
    
    z <- "\n</style>\n\t<div class=\"container-fluid main-container\">\n\t"
    
    c(x, y, z)
}
```

#### htmlBottom

`htmlBottom` .



```r
htmlBottom <- function(...) {
    # temporary
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
```
