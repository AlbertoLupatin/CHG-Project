java -jar ../Tools/GenomeAnalysisTK.jar -T RealignerTargetCreator -R ../Anotations/human_g1k_v37.fasta -I ../1_Preprocessing/Control.sorted.bam -o realigner_c.intervals
java -jar ../Tools/GenomeAnalysisTK.jar -T IndelRealigner -R ../Annotations/human_g1k_v37.fasta -I ../1_Preprocessing/Control.sorted.bam -targetIntervals realigner_c.intervals -o Control.sorted.realigned.bam

java -jar ../Tools/GenomeAnalysisTK.jar -T RealignerTargetCreator -R ../Anotations/human_g1k_v37.fasta -I ../1_Preprocessing/Tumor.sorted.bam -o realigner_t.intervals
java -jar ../Tools/GenomeAnalysisTK.jar -T IndelRealigner -R ../Annotations/human_g1k_v37.fasta -I ../1_Preprocessing/Tumor.sorted.bam -targetIntervals realigner_intervals.t -o Tumor.sorted.realigned.bam
