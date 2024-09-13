## SNPs
cd Control
samtools mpileup -B -f ../../Annotations/human_g1k_v37.fasta ../../4_Duplicates/Control_fin.bam > Control_fin.pileup
java -jar ../../Tools/VarScan.v2.3.9.jar mpileup2snp Control_fin.pileup --p-value 0.01 --output-vcf 1 > Control.VARSCAN.vcf
vcftools --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Control.VARSCAN.vcf --out Control.VARSCAN --recode --recode-INFO-all

cd ../Tumor
samtools mpileup -B -f ../../Annotations/human_g1k_v37.fasta ../../4_Duplicates/Tumor_fin.bam > Tumor_fin.pileup
java -jar ../../Tools/VarScan.v2.3.9.jar mpileup2snp Tumor_fin.pileup --p-value 0.01 --output-vcf 1 > Tumor.VARSCAN.vcf
vcftools --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Tumor.VARSCAN.vcf --out Tumor.VARSCAN --recode --recode-INFO-all

cd ..
vcftools --vcf Control/Control.VARSCAN.recode.vcf --diff Tumor/Tumor.VARSCAN.recode.vcf --diff-site

## Somatic point mutations
java -jar ../Tools/VarScan.v2.3.9.jar somatic Control/Control_fin.pileup Tumor/Tumor_fin.pileup --output-snp somatic.pm --output-indel somatic.indel --output-vcf 1
samtools mpileup -f ../Annotations/human_g1k_v37.fasta -q 1 -B ../4_Duplicates/Control_fin.bam ../4_Duplicates/Tumor_fin.bam > Normal-Tumor.mpileup

## Annotation
java -Xmx4g -jar ../Tools/snpEff/snpEff.jar -v hg19kg somatic.pm.vcf -s somatic.pm.vcf.html > somatic.pm.ann.vcf
cat somatic.pm.ann.vcf | java -Xmx4g -jar ../Tools/snpEff/SnpSift.jar filter "(POS = 1896100)"
