

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0000775","chromosome, centromeric region",1.022,8.6833,0.608,0.000,"chromosome, centromeric region"),
c("GO:0032133","chromosome passenger complex",0.027,4.0319,0.688,0.684,"chromosome, centromeric region"),
c("GO:0015629","actin cytoskeleton",2.439,2.3495,0.676,0.501,"chromosome, centromeric region"),
c("GO:0015630","microtubule cytoskeleton",5.906,3.8638,0.648,0.600,"chromosome, centromeric region"),
c("GO:0005694","chromosome",4.938,2.6864,0.714,0.340,"chromosome, centromeric region"),
c("GO:0005819","spindle",1.622,6.3336,0.649,0.279,"chromosome, centromeric region"),
c("GO:0072686","mitotic spindle",0.373,5.2661,0.666,0.548,"chromosome, centromeric region"),
c("GO:0051233","spindle midzone",0.151,4.8350,0.687,0.671,"chromosome, centromeric region"),
c("GO:0005871","kinesin complex",0.303,5.2015,0.635,0.537,"chromosome, centromeric region"),
c("GO:0005875","microtubule associated complex",0.795,2.8047,0.615,0.595,"chromosome, centromeric region"),
c("GO:0097149","centralspindlin complex",0.016,3.3468,0.686,0.566,"chromosome, centromeric region"),
c("GO:0031617","NMS complex",0.112,3.0046,0.600,0.697,"chromosome, centromeric region"),
c("GO:0005856","cytoskeleton",11.022,4.2703,0.691,0.466,"chromosome, centromeric region"),
c("GO:0098687","chromosomal region",1.769,6.4581,0.631,0.698,"chromosome, centromeric region"),
c("GO:0010369","chromocenter",0.076,2.5765,0.673,0.674,"chromosome, centromeric region"),
c("GO:0031262","Ndc80 complex",0.022,3.0046,0.637,0.609,"chromosome, centromeric region"),
c("GO:0005811","lipid particle",0.384,4.7104,0.770,0.239,"chromosome, centromeric region"),
c("GO:0000793","condensed chromosome",1.141,8.6157,0.653,0.632,"chromosome, centromeric region"),
c("GO:0000940","condensed chromosome outer kinetochore",0.065,6.9279,0.604,0.665,"chromosome, centromeric region"),
c("GO:0030864","cortical actin cytoskeleton",0.308,2.3461,0.642,0.460,"chromosome, centromeric region"),
c("GO:0005575","cellular_component",100.000,2.7119,1.000,0.000,"cellular_component"),
c("GO:0005576","extracellular region",25.630,10.0075,0.979,0.000,"extracellular region"),
c("GO:0005581","collagen trimer",0.481,5.8936,0.850,0.000,"collagen trimer"),
c("GO:0043235","receptor complex",1.752,2.4706,0.876,0.204,"collagen trimer"),
c("GO:0097125","cyclin B1-CDK1 complex",0.011,2.3500,0.871,0.205,"collagen trimer"),
c("GO:0031261","DNA replication preinitiation complex",0.027,2.8803,0.857,0.141,"collagen trimer"),
c("GO:0005788","endoplasmic reticulum lumen",1.103,2.8094,0.888,0.154,"collagen trimer"),
c("GO:0031012","extracellular matrix",2.774,11.1492,0.942,0.000,"extracellular matrix"),
c("GO:0045171","intercellular bridge",0.238,2.3504,0.946,0.254,"extracellular matrix"),
c("GO:0005615","extracellular space",8.464,4.4633,0.941,0.403,"extracellular matrix"),
c("GO:0099080","supramolecular complex",4.889,4.4145,0.973,0.000,"supramolecular complex"),
c("GO:0099512","supramolecular fiber",4.846,4.5394,0.836,0.000,"supramolecular fiber"),
c("GO:0005583","fibrillar collagen trimer",0.065,2.0437,0.753,0.554,"supramolecular fiber"),
c("GO:0030496","midbody",0.784,5.1208,0.968,0.002,"midbody"),
c("GO:0009986","cell surface",4.132,4.6212,0.969,0.003,"cell surface"),
c("GO:0009897","external side of plasma membrane",1.498,4.0272,0.816,0.003,"external side of plasma membrane"),
c("GO:0098590","plasma membrane region",5.165,3.3965,0.792,0.622,"external side of plasma membrane"),
c("GO:0016021","integral component of membrane",29.730,3.7150,0.860,0.527,"external side of plasma membrane"),
c("GO:0030673","axolemma",0.087,2.4507,0.830,0.447,"external side of plasma membrane"),
c("GO:0005901","caveola",0.395,2.5045,0.820,0.345,"external side of plasma membrane"),
c("GO:0042383","sarcolemma",0.638,2.8199,0.884,0.192,"external side of plasma membrane"),
c("GO:0005886","plasma membrane",28.794,8.1090,0.836,0.318,"external side of plasma membrane"),
c("GO:0005887","integral component of plasma membrane",8.421,4.5812,0.769,0.684,"external side of plasma membrane"),
c("GO:0098552","side of membrane",2.618,2.8496,0.898,0.161,"external side of plasma membrane"),
c("GO:0031224","intrinsic component of membrane",30.454,5.1206,0.870,0.262,"external side of plasma membrane"),
c("GO:0031226","intrinsic component of plasma membrane",8.794,6.5778,0.775,0.506,"external side of plasma membrane"),
c("GO:0031225","anchored component of membrane",0.871,3.9231,0.900,0.141,"external side of plasma membrane"),
c("GO:0016324","apical plasma membrane",1.558,2.3954,0.798,0.580,"external side of plasma membrane"),
c("GO:1903439","calcitonin family receptor complex",0.047,2.5577,0.760,0.283,"external side of plasma membrane"),
c("GO:0098797","plasma membrane protein complex",1.314,2.1765,0.710,0.393,"external side of plasma membrane"),
c("GO:0097648","G-protein coupled receptor complex",0.016,2.5667,0.790,0.567,"external side of plasma membrane"),
c("GO:0071944","cell periphery",29.346,7.6215,0.974,0.005,"cell periphery"),
c("GO:0045120","pronucleus",0.076,2.9140,0.939,0.023,"pronucleus"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
