setwd("/Users/albertolupatin/Desktop/HumanGenomics/Proj/5_VariantCalling")

library(vcfR)

VC_b <- read.vcfR("Control/Control.BCF.recode.vcf")
VC_g <- read.vcfR("Control/Control.GATK.recode.vcf")

b <- as.data.frame(VC_b@fix)
g <- as.data.frame(VC_g@fix)

chr_b <- unique(b$CHROM)
chr_g <- unique(g$CHROM)

setdiff(chr_b, chr_g)
setdiff(chr_g, chr_b)


VC_b <- read.vcfR("Tumor/Tumor.BCF.recode.vcf")
VC_g <- read.vcfR("Tumor/Tumor.GATK.recode.vcf")

b <- as.data.frame(VC_b@fix)
g <- as.data.frame(VC_g@fix)

chr_b <- unique(b$CHROM)
chr_g <- unique(g$CHROM)

setdiff(chr_b, chr_g)
setdiff(chr_g, chr_b)