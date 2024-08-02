# HI-C Scaffolding

## HI-C reads mapping

```bash
bwa mem -t 24 Cgal.hic.p.purged.fa clam_hic_1.fq | samtools view -@ 10 -Sb - > forward.bam
bwa mem -t 24 Cgal.hic.p.purged.fa clam_hic_2.fq | samtools view -@ 10 -Sb - > reverse.bam

```
