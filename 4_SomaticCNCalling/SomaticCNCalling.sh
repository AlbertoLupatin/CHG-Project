samtools mpileup -q 1 -f ../Annotations/human_g1k_v37.fasta ../4_Duplicates/Control_fin.bam ../4_Duplicates/Tumor_fin.bam | java -jar ../Tools/VarScan.v2.3.9.jar copynumber --output-file SCNA --mpileup 1

java -jar ../Tools/VarScan.v2.3.9.jar copyCaller SCNA.copynumber --output-file SCNA.copynumber.called

Rscript CBS.R
