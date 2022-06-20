#First must have dada2 and Bioconductor installed: https://benjjneb.github.io/dada2/dada-installation.html 
#Must also have phyloseq installed: http://joey711.github.io/phyloseq/install.html
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")
library(ggpubr)
library(gplots)
library(viridis)
library(hrbrthemes)
library(ggsci)

library(dada2); 
packageVersion("dada2")


input <- function(inputfile) {
print(plotQualityProfile)
  pfix <<- prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

  filterdir <<- inputfile
  #print(filterdir)
}

run <- function() {
path <<- filterdir # CHANGE ME to the directory containing the fastq files after unzipping.
#print(list.files(path))
#print(path)

# Forward and reverse fastq filenames have format: SAMPLENAME_R1_001.fastq and SAMPLENAME_R2_001.fastq
filtFs <<- sort(list.files(path, pattern="_R1.fastq", full.names = TRUE))
filtRs <<- sort(list.files(path, pattern="_R2.fastq", full.names = TRUE))

#print(filtFs)
#print(filtRs)
# Extract sample names, assuming filenames have format: SAMPLENAME_XXX.fastq
#sample.names <<- sapply(strsplit(basename(fnFs), "_"), `[`, 1)

#Inspect read quality profiles------------------

}

output <- function(outputfile) {
	#pdf(paste(outputfile,"pdf",sep="."));#, height=1500, width=10000);
#Filter and trim--------------------------------
#Place filtered files in filtered/ subdirectory
#filtFs <- file.path(paste0(outputfile, sample.names, "_F_filt.fastq.gz"))
#filtRs <- file.path(paste0(outputfile, sample.names, "_R_filt.fastq.gz"))
#names(filtFs) <- sample.names
#names(filtRs) <- sample.names
qualF <- plotQualityProfile(filtFs, aggregate=TRUE)
qualR <- plotQualityProfile(filtRs, aggregate=TRUE)
print(str(qualF))
write.csv(qualF$data$Cycle, paste(outputfile, ".forward.cycle.csv", sep=""))
write.csv(qualF$data$Score, paste(outputfile, ".forward.score.csv", sep=""))
write.csv(qualF$data$Count, paste(outputfile, ".forward.count.csv", sep=""))
write.csv(qualR$data$Cycle, paste(outputfile, ".reverse.cycle.csv", sep=""))
write.csv(qualR$data$Score, paste(outputfile, ".reverse.score.csv", sep=""))
write.csv(qualR$data$Count, paste(outputfile, ".reverse.count.csv", sep=""))
qualF
ggsave(paste(outputfile,"forward","png",sep="."), plot=qualF, device = "png", dpi = 700)
qualR
ggsave(paste(outputfile,"reverse","png",sep="."), plot=qualR, device = "png", dpi = 700)

#print(fnFs)
#print(filtFs)
#print(fnRs)
#print(filtRs)
#out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(truncForward, truncReverse), trimLeft = c(trimForward, trimReverse),
#                     maxN=maxN, maxEE=maxEE, truncQ=truncQ, rm.phix=TRUE,
#                     compress=TRUE, multithread=TRUE, n = 1e+09) # On Windows set multithread=FALSE
#dev.off()
}


