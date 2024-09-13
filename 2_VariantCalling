# CONTROL
cd Control

bcftools mpileup -Ou -a DP -f ../../Annotations/human_g1k_v37.fasta ../../4_Duplicates/Control_fin.bam | bcftools call -Ov -c -v > Control.BCF.vcf
java -jar ../../Tools/GenomeAnalysisTK.jar -T UnifiedGenotyper -R ../../Annotations/human_g1k_v37.fasta -I ../../4_Duplicates/Control_fin.bam -o Control.GATK.vcf

vcftools --minQ 20 --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Control.BCF.vcf --out Control.BCF --recode --recode-INFO-all
vcftools --minQ 20 --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Control.GATK.vcf --out Control.GATK --recode --recode-INFO-all

vcftools --vcf Control.BCF.recode.vcf --diff Control.GATK.recode.vcf --diff-site

# TUMOR
cd ../Tumor

bcftools mpileup -Ou -a DP -f ../../Annotations/human_g1k_v37.fasta ../../4_Duplicates/Tumor_fin.bam | bcftools call -Ov -c -v > Tumor.BCF.vcf
java -jar ../../Tools/GenomeAnalysisTK.jar -T UnifiedGenotyper -R ../../Annotations/human_g1k_v37.fasta -I ../../4_Duplicates/Tumor_fin.bam -o Tumor.GATK.vcf

vcftools --minQ 20 --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Tumor.BCF.vcf --out Tumor.BCF --recode --recode-INFO-all
vcftools --minQ 20 --max-meanDP 200 --min-meanDP 5 --remove-indels --vcf Tumor.GATK.vcf --out Tumor.GATK --recode --recode-INFO-all

vcftools --vcf Tumor.BCF.recode.vcf --diff Tumor.GATK.recode.vcf --diff-site
