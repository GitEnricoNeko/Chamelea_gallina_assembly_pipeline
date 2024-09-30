# Gene annotation

## hisat2

```bash
hisat2-build -p 10 $Genome_prefix.final.masked.fa $Genome_prefix 
hisat2 -p 20 -x $Genome_prefix -1 Gill_1.fq.gz -2 Gill_2.fq.gz | samtools sort -@ 10 > Gill.bam &
hisat2 -p 20 -x $Genome_prefix -1 Gonad_1.fq.gz -2 Gonad_2.fq.gz | samtools sort -@ 10 > Gonad.bam &
hisat2 -p 20 -x $Genome_prefix -1 Mantle_1.fq.gz -2 Mantle_2.fq.gz | samtools sort -@ 10 > Mantle.bam &
hisat2 -p 20 -x $Genome_prefix -1 Haemolymph_1.fq.gz -2 Haemolymph_2.fq.gz | samtools sort -@ 10 > Haemolymph.bam 
hisat2 -p 20 -x $Genome_prefix -1 Hepatopancreas_1.fq.gz -2 Hepatopancreas_2.fq.gz | samtools sort -@ 10 > Hepatopancreas.bam 
```

## Braker3

```bash
singularity exec singularity/braker3.sif braker.pl --genome $Genome_prefix.final.masked.fa --prot_seq protein.fa --bam Gill.bam,Gonad.bam,Mantle.bam,Haemolymph.bam,Hepatopancreas.bam --threads 18  --softmasking --species={$Genome_prefix} --skip_fixing_broken_genes 
```

