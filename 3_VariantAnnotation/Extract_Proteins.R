setwd("/Users/albertolupatin/Desktop/HumanGenomics/Proj/6_VariantAnnotation/Control")

x_g <- read.table("Control.gatk.recode.ann.genes.txt",
                sep="\t", header=TRUE)

pro_g <- x_g
pro_g <- pro_g[pro_g$X.1 == "protein_coding",]
pro_g <- pro_g[pro_g$X1 == 1,]
pro_g <- pro_g[pro_g$X != "",]

library(data.table)
fwrite(list(pro_g$X), file = "Control_Genes_BCF.txt")

x_b <- read.table("Control.BCF.recode.ann.genes.txt",
           sep="\t", header=TRUE)

pro_b <- x_b
pro_b <- pro_b[pro_b$X.1 == "protein_coding",]
pro_b <- pro_b[pro_b$X1 == 1,]
pro_b <- pro_b[pro_b$X != "",]

library(data.table)
fwrite(list(pro_b$X), file = "Control_Genes_BCF.txt")

inter_c <- intersect(pro_b$X, pro_g$X)

setwd("/Users/albertolupatin/Desktop/HumanGenomics/Proj/6_VariantAnnotation/Tumor")

t_g <- read.table("Tumor.gatk.recode.ann.genes.txt",
                  sep="\t", header=TRUE)

pro_tg <- t_g
pro_tg <- pro_tg[pro_tg$X.1 == "protein_coding",]
pro_tg <- pro_tg[pro_tg$X1 == 1,]
pro_tg <- pro_tg[pro_tg$X != "",]

t_b <- read.table("Tumor.BCF.recode.ann.genes.txt",
                  sep="\t", header=TRUE)

pro_tb <- t_b
pro_tb <- pro_tb[pro_tb$X.1 == "protein_coding",]
pro_tb <- pro_tb[pro_tb$X1 == 1,]
pro_tb <- pro_tb[pro_tb$X != "",]

inter_t <- intersect(pro_tg$X, pro_tb$X)
