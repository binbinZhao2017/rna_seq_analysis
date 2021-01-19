

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
revigo.data <- rbind(c("GO:0003777","microtubule motor activity",0.456,4.3464,0.828,0.000,"microtubule motor activity"),
c("GO:0004745","retinol dehydrogenase activity",0.104,3.9803,0.794,0.113,"microtubule motor activity"),
c("GO:0015616","DNA translocase activity",0.017,2.3442,0.861,0.414,"microtubule motor activity"),
c("GO:0001758","retinal dehydrogenase activity",0.040,2.0396,0.838,0.406,"microtubule motor activity"),
c("GO:0018455","alcohol dehydrogenase [NAD(P)+] activity",0.006,2.5165,0.822,0.597,"microtubule motor activity"),
c("GO:0003774","motor activity",0.780,3.7664,0.829,0.567,"microtubule motor activity"),
c("GO:0016887","ATPase activity",2.490,2.7198,0.815,0.680,"microtubule motor activity"),
c("GO:0004222","metalloendopeptidase activity",0.670,2.1569,0.862,0.645,"microtubule motor activity"),
c("GO:0004806","triglyceride lipase activity",0.127,2.2636,0.881,0.264,"microtubule motor activity"),
c("GO:0047023","androsterone dehydrogenase activity",0.017,2.6313,0.808,0.639,"microtubule motor activity"),
c("GO:0043138","3'-5' DNA helicase activity",0.069,2.6708,0.847,0.459,"microtubule motor activity"),
c("GO:0009975","cyclase activity",0.127,2.1955,0.915,0.115,"microtubule motor activity"),
c("GO:0018636","phenanthrene 9,10-monooxygenase activity",0.017,3.6098,0.831,0.687,"microtubule motor activity"),
c("GO:0008094","DNA-dependent ATPase activity",0.462,2.1952,0.832,0.568,"microtubule motor activity"),
c("GO:0008237","metallopeptidase activity",1.115,2.4550,0.857,0.322,"microtubule motor activity"),
c("GO:0004022","alcohol dehydrogenase (NAD) activity",0.052,2.7013,0.802,0.688,"microtubule motor activity"),
c("GO:0004024","alcohol dehydrogenase activity, zinc-dependent",0.035,2.0507,0.806,0.669,"microtubule motor activity"),
c("GO:0016849","phosphorus-oxygen lyase activity",0.127,2.7356,0.915,0.115,"microtubule motor activity"),
c("GO:0016229","steroid dehydrogenase activity",0.162,3.1619,0.826,0.472,"microtubule motor activity"),
c("GO:0016709","oxidoreductase activity, acting on paired donors, with incorporation or reduction of molecular oxygen, NAD(P)H as one donor, and incorporation of one atom of oxygen",0.208,3.3065,0.811,0.456,"microtubule motor activity"),
c("GO:0047115","trans-1,2-dihydrobenzene-1,2-diol dehydrogenase activity",0.023,3.0398,0.843,0.391,"microtubule motor activity"),
c("GO:0005198","structural molecule activity",4.166,2.4841,0.977,0.000,"structural molecule activity"),
c("GO:0005201","extracellular matrix structural constituent",0.451,9.5204,0.955,0.000,"extracellular matrix structural constituent"),
c("GO:0030023","extracellular matrix constituent conferring elasticity",0.029,2.4199,0.950,0.667,"extracellular matrix structural constituent"),
c("GO:0030021","extracellular matrix structural constituent conferring compression resistance",0.035,2.9504,0.950,0.456,"extracellular matrix structural constituent"),
c("GO:0005319","lipid transporter activity",0.705,2.5678,0.958,0.000,"lipid transporter activity"),
c("GO:0055056","D-glucose transmembrane transporter activity",0.052,2.2388,0.960,0.404,"lipid transporter activity"),
c("GO:0034632","retinol transporter activity",0.006,2.3577,0.961,0.344,"lipid transporter activity"),
c("GO:0005539","glycosaminoglycan binding",1.179,10.7765,0.925,0.000,"glycosaminoglycan binding"),
c("GO:0008201","heparin binding",0.890,8.1728,0.873,0.388,"glycosaminoglycan binding"),
c("GO:0005524","ATP binding",8.661,2.2962,0.777,0.516,"glycosaminoglycan binding"),
c("GO:0008528","G-protein coupled peptide receptor activity",0.745,2.9255,0.885,0.000,"G-protein coupled peptide receptor activity"),
c("GO:0004955","prostaglandin receptor activity",0.058,2.6206,0.895,0.458,"G-protein coupled peptide receptor activity"),
c("GO:0038023","signaling receptor activity",8.083,5.2386,0.885,0.574,"G-protein coupled peptide receptor activity"),
c("GO:0001653","peptide receptor activity",0.751,3.1103,0.898,0.472,"G-protein coupled peptide receptor activity"),
c("GO:0016538","cyclin-dependent protein serine/threonine kinase regulator activity",0.173,2.3786,0.976,0.000,"cyclin-dependent protein serine/threonine kinase regulator activity"),
c("GO:0060089","molecular transducer activity",9.545,5.2386,0.978,0.000,"molecular transducer activity"),
c("GO:0017129","triglyceride binding",0.012,2.2924,0.955,0.004,"triglyceride binding"),
c("GO:0003688","DNA replication origin binding",0.075,2.2940,0.942,0.005,"DNA replication origin binding"),
c("GO:1901265","nucleoside phosphate binding",12.353,2.0177,0.915,0.150,"DNA replication origin binding"),
c("GO:0042562","hormone binding",0.370,3.4793,0.971,0.006,"hormone binding"),
c("GO:0008144","drug binding",0.584,2.1667,0.970,0.006,"drug binding"),
c("GO:0019838","growth factor binding",0.757,3.2879,0.963,0.006,"growth factor binding"),
c("GO:0043177","organic acid binding",1.034,3.9072,0.878,0.006,"organic acid binding"),
c("GO:0031406","carboxylic acid binding",1.028,3.5238,0.820,0.370,"organic acid binding"),
c("GO:0019842","vitamin binding",0.474,2.6217,0.886,0.341,"organic acid binding"),
c("GO:1901681","sulfur compound binding",1.300,6.0966,0.970,0.006,"sulfur compound binding"),
c("GO:0042277","peptide binding",1.439,4.9196,0.919,0.007,"peptide binding"),
c("GO:0033218","amide binding",1.629,4.4701,0.970,0.007,"amide binding"),
c("GO:0005509","calcium ion binding",4.114,3.8913,0.937,0.008,"calcium ion binding"),
c("GO:0043168","anion binding",15.751,4.2778,0.931,0.263,"calcium ion binding"),
c("GO:0097367","carbohydrate derivative binding",12.972,6.0253,0.970,0.011,"carbohydrate derivative binding"),
c("GO:0036094","small molecule binding",13.960,3.5535,0.971,0.014,"small molecule binding"),
c("GO:0008009","chemokine activity",0.277,2.4441,0.948,0.031,"chemokine activity"),
c("GO:0005518","collagen binding",0.376,3.2150,0.954,0.032,"collagen binding"),
c("GO:0010997","anaphase-promoting complex binding",0.035,2.8322,0.956,0.444,"collagen binding"),
c("GO:0030165","PDZ domain binding",0.497,2.1905,0.963,0.032,"PDZ domain binding"),
c("GO:0008092","cytoskeletal protein binding",4.934,2.6373,0.961,0.042,"cytoskeletal protein binding"),
c("GO:0008017","microtubule binding",1.265,2.8418,0.937,0.045,"microtubule binding"),
c("GO:0015631","tubulin binding",1.705,2.2064,0.936,0.678,"microtubule binding"),
c("GO:0032027","myosin light chain binding",0.035,2.1990,0.945,0.464,"microtubule binding"),
c("GO:0046983","protein dimerization activity",6.887,4.2841,0.960,0.058,"protein dimerization activity"),
c("GO:0005102","receptor binding",8.765,3.2918,0.960,0.065,"receptor binding"));

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
