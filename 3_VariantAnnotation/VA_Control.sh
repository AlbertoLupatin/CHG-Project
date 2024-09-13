java -Xmx4g -jar ../../Tools/snpEff/snpEff.jar -v hg19kg ../../5_VariantCalling/Control/Control.BCF.recode.vcf -s Control.BCF.recode.ann.html > Control.BCF.recode.ann.vcf
java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar Annotate ../../Annotations/hapmap_3.3.b37.vcf Control.BCF.recode.ann.vcf > Control.BCF.recode.ann2.vcf
java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar Annotate ../../Annotations/clinvar_Pathogenic.vcf Control.BCF.recode.ann2.vcf > Control.BCF.recode.ann3.vcf

java -Xmx4g -jar ../../Tools/snpEff/snpEff.jar -v hg19kg  ../../5_VariantCalling/Control/Control.GATK.recode.vcf -s Control.GATK.recode.ann.html > Control.GATK.recode.ann.vcf
java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar Annotate ../../Annotations/hapmap_3.3.b37.vcf  Control.GATK.recode.ann.vcf > Control.GATK.recode.ann2.vcf
java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar Annotate ../../Annotations/clinvar_Pathogenic.vcf Control.GATK.recode.ann2.vcf > Control.GATK.recode.ann3.vcf

cat Control.BCF.recode.ann3.vcf | java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar filter "(ANN[ANY].IMPACT = 'HIGH') & (DP > 20) & (exists ID)" 
cat Control.GATK.recode.ann3.vcf | java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar filter "(ANN[ANY].IMPACT = 'HIGH') & (DP > 20) & (exists ID)" 

cat Control.BCF.recode.ann3.vcf | java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar filter "(exists CLNSIG)"
cat Control.GATK.recode.ann3.vcf | java -Xmx4g -jar ../../Tools/snpEff/snpSift.jar filter "(exists CLNSIG)"
