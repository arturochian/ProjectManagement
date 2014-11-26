# INSERT_TITLE_HERE
Matthew Leonawicz  




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

## Project hierarchy R code
Here is the code used to generate the current project hierarchy Sankey diagram.
Current projects are hardcoded and are updated by hand when my work changes.


```r
require(igraph)
require(rCharts)

proj.mp <- c("Alfresco Noatak", "Alfresco Statewide", "Spatial Lightning Analysis", "Data Extraction and Uncertainty Analysis", "Growing Season", "Mussel Project", "Land Carbon")
proj.etal <- c("Alfresco CRU/GCM Experimental Design", "Bird Project", "NWT/Comm. Charts DS", "Sea Ice Edge Maps and Spinoff Projects", "Shiny App Server Migration")
proj.m <- c("CMIP3/CMIP5 GCM Comparisons", "Effective Spatial Scale Analysis", "Randscape Development", "Alfresco Outputs")
proj.ongoing <- c("SNAP Data QA/QC", "Training/Supervision", "R Shiny Apps General Maintenance", "New App Development", "SNAP Tech Blog", "Continuing Education")
proj.halted <- c("FRP/FRI Scale-Conditional Alfresco Maps", "Moose Project")
projects.list <-list(proj.mp, proj.etal, proj.m, proj.ongoing, proj.halted)

actors.etal <- list(c("Paul", "Alec"), "Angie", c("Angie", "Bob"), "Angie", "Bob")
actors.all <- unique(c("Matt", "Paul", unlist(actors.etal)))
status.colors <- rep(c("green", "blue", "orange", "purple", "red"), times=sapply(projects.list, length))
status.colors <- rep(c("green", "blue", "orange", "purple", "red"), times=sapply(projects.list, length))

from <- c(
	# LHS
	rep("Collaborators", length(actors.all[actors.all!="Matt"])),
	rep("Matt", length(c(proj.m, proj.ongoing, proj.halted))),
	# Middle
	rep(c("Matt", "Paul"), length(proj.mp)),
	rep("Matt", length(proj.etal)),
	unlist(actors.etal),
	# Specific connections
	rep("Alfresco Outputs", 3),
	rep("SNAP Data QA/QC", 4),
	rep("Spatial Lightning Analysis", 3),
	rep("Sea Ice Edge Maps and Spinoff Projects", 2),
	rep("Training/Supervision", 2),
	rep("Randscape Development", 2),
	rep("Effective Spatial Scale Analysis", 2),
	rep("NWT/Comm. Charts DS", 1),
	c("Alfresco Noatak", "Alfresco Statewide"),
	rep("Data Extraction and Uncertainty Analysis", 4)
	
)
to <- c(
	# Middle
	actors.all[actors.all!="Matt"],
	proj.m,
	proj.ongoing,
	proj.halted,
	# RHS
	rep(proj.mp, 2),
	proj.etal,
	rep(proj.etal, times=sapply(actors.etal, length)),
	# Specific connections
	c("CMIP3/CMIP5 GCM Comparisons", "Land Carbon", "Bird Project"), # from "Alfresco Outputs"
	c("Alfresco Outputs", "CMIP3/CMIP5 GCM Comparisons", "Alfresco CRU/GCM Experimental Design", "NWT/Comm. Charts DS"), # from "SNAP Data QA/QC"
	c("Alfresco Noatak", "Alfresco Statewide", "Randscape Development"), # from "Spatial Lightning Analysis
	c("Randscape Development", "Alfresco Outputs"), # from "Sea Ice Edge Maps and Spinoff Projects"
	c("Bird Project", "NWT/Comm. Charts DS"), # from "Training/Supervision"
	c("Alfresco Outputs", "Effective Spatial Scale Analysis"), # from "Randscape Development
	c("Alfresco Outputs", "FRP/FRI Scale-Conditional Alfresco Maps"), # from "Effective Spatial Scale Analysis"
	c("CMIP3/CMIP5 GCM Comparisons"), #from "NWT/Comm. Charts DS"
	rep("FRP/FRI Scale-Conditional Alfresco Maps", 2), # from "Alfresco Noatak", "Alfresco Statewide"
	c("CMIP3/CMIP5 GCM Comparisons", "Effective Spatial Scale Analysis", "Randscape Development", "Alfresco Outputs") # from "Data Extraction and Uncertainty Analysis"
)
relations <- data.frame(from=from, to=to)
g <- graph.data.frame(relations, directed=T, vertices=data.frame(c("Collaborators", actors.all, unlist(projects.list))))

#V(g)$weight = 0
#V(g)[degree(g,mode="out")==0]$weight <- runif(n=length(V(g)[degree(g,mode="out")==0]),min=0,max=100)
#E(g)[to(V(g)$weight>0)]$weight <- V(g)[V(g)$weight>0]$weight
#while(max(is.na(E(g)$weight))) {
#	df <- get.data.frame(g)
#	for (i in 1:nrow(df)) {
#		x = df[i,]
#		if(max(df$from==x$to)) {
#			E(g)[from(x$from) & to(x$to)]$weight = sum(E(g)[from(x$to)]$weight)
#		}
#	}
#}
gw <- get.data.frame(g)
gw$value <- 1
colnames(gw) <- c("source","target","value")
gw$source <- as.character(gw$source)
gw$target <- as.character(gw$target)
p <- rCharts$new()
p$setLib('http://timelyportfolio.github.io/rCharts_d3_sankey/libraries/widgets/d3_sankey')
p$setTemplate(script = "http://timelyportfolio.github.io/rCharts_d3_sankey/libraries/widgets/d3_sankey/layouts/chart.html")
p$set(
data = gw,
nodeWidth = 15,
nodePadding = 10,
layout = 32,
width = 900,
height = 600,
margin = list(right = 20, left = 20, bottom = 20, top = 20),
title = "Matt's Projects"
)

p$setTemplate(
  afterScript = "
<script>
  var cscale = d3.scale.category20b();

  // to be specific in case you have more than one chart
  d3.selectAll('#{{ chartId }} svg path.link')
    .style('stroke', function(d){
      //here we will use the source color
      //if you want target then sub target for source
      //or if you want something other than gray
      //supply a constant
      //or use a categorical scale or gradient
      //return d.source.color;
      return cscale(d.source.name);
    })
   //note no changes were made to opacity
   //to do uncomment below but will affect mouseover
   //so will need to define mouseover and mouseout
   //happy to show how to do this also
   // .style('stroke-opacity', .7)
  d3.selectAll('#{{ chartId }} svg .node rect')
    .style('fill', function(d){
      return cscale(d.name)
    })
    .style('stroke', 'none')
</script>
")
```


```r
p$show("iframesrc", cdn=T)
```

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
      height: 600px;
    }  
    &lt;/style&gt;
    
  &lt;/head&gt;
  &lt;body &gt;
    
    &lt;div id = &#039;chart14f87074664f&#039; class = &#039;rChart d3_sankey&#039;&gt;&lt;/div&gt;    
    ï»¿&lt;!--Attribution:
Mike Bostock https://github.com/d3/d3-plugins/tree/master/sankey
Mike Bostock http://bost.ocks.org/mike/sankey/
--&gt;

&lt;script&gt;
(function(){
var params = {
 &quot;dom&quot;: &quot;chart14f87074664f&quot;,
&quot;width&quot;:    900,
&quot;height&quot;:    600,
&quot;data&quot;: {
 &quot;source&quot;: [ &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Collaborators&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Matt&quot;, &quot;Paul&quot;, &quot;Alec&quot;, &quot;Angie&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;Alfresco Outputs&quot;, &quot;Alfresco Outputs&quot;, &quot;Alfresco Outputs&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;SNAP Data QA/QC&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Training/Supervision&quot;, &quot;Training/Supervision&quot;, &quot;Randscape Development&quot;, &quot;Randscape Development&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot; ],
&quot;target&quot;: [ &quot;Paul&quot;, &quot;Alec&quot;, &quot;Angie&quot;, &quot;Bob&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot;, &quot;SNAP Data QA/QC&quot;, &quot;Training/Supervision&quot;, &quot;R Shiny Apps General Maintenance&quot;, &quot;New App Development&quot;, &quot;SNAP Tech Blog&quot;, &quot;Continuing Education&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;Moose Project&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Growing Season&quot;, &quot;Mussel Project&quot;, &quot;Land Carbon&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Spatial Lightning Analysis&quot;, &quot;Data Extraction and Uncertainty Analysis&quot;, &quot;Growing Season&quot;, &quot;Mussel Project&quot;, &quot;Land Carbon&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Shiny App Server Migration&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Sea Ice Edge Maps and Spinoff Projects&quot;, &quot;Shiny App Server Migration&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Land Carbon&quot;, &quot;Bird Project&quot;, &quot;Alfresco Outputs&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Alfresco CRU/GCM Experimental Design&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Noatak&quot;, &quot;Alfresco Statewide&quot;, &quot;Randscape Development&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot;, &quot;Bird Project&quot;, &quot;NWT/Comm. Charts DS&quot;, &quot;Alfresco Outputs&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Alfresco Outputs&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;FRP/FRI Scale-Conditional Alfresco Maps&quot;, &quot;CMIP3/CMIP5 GCM Comparisons&quot;, &quot;Effective Spatial Scale Analysis&quot;, &quot;Randscape Development&quot;, &quot;Alfresco Outputs&quot; ],
&quot;value&quot;: [      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1,      1 ] 
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
&quot;id&quot;: &quot;chart14f87074664f&quot; 
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
    
      // to be specific in case you have more than one chart
      d3.selectAll(&#039;#chart14f87074664f svg path.link&#039;)
        .style(&#039;stroke&#039;, function(d){
          //here we will use the source color
          //if you want target then sub target for source
          //or if you want something other than gray
          //supply a constant
          //or use a categorical scale or gradient
          //return d.source.color;
          return cscale(d.source.name);
        })
       //note no changes were made to opacity
       //to do uncomment below but will affect mouseover
       //so will need to define mouseover and mouseout
       //happy to show how to do this also
       // .style(&#039;stroke-opacity&#039;, .7)
      d3.selectAll(&#039;#chart14f87074664f svg .node rect&#039;)
        .style(&#039;fill&#039;, function(d){
          return cscale(d.name)
        })
        .style(&#039;stroke&#039;, &#039;none&#039;)
    &lt;/script&gt;
        
  &lt;/body&gt;
&lt;/html&gt; ' scrolling='no' frameBorder='0' seamless class='rChart  http://timelyportfolio.github.io/rCharts_d3_sankey/libraries/widgets/d3_sankey  ' id='iframe-chart14f87074664f'> </iframe>
 <style>iframe.rChart{ width: 100%; height: 400px;}</style>
<style>iframe.rChart{ width: 100%; height: 640px;}</style>
