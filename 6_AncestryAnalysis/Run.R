library(EthSEQ)

setwd("/Users/albertolupatin/Desktop/HumanGenomics/Proj/9_Ancestry")

ethseq.Analysis(
  target.vcf = "../5_VariantCalling/Control/Control.GATK.vcf",
  out.dir = "./results/",
  model.gds = "./ReferenceModel.gds",
  cores=1,
  verbose=TRUE,
  composite.model.call.rate = 0.99,
  space="3D",)
