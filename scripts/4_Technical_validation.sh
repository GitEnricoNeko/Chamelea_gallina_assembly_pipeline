## Quality Control

Change the parameters based on the organism of interest

##BUSCO

```bash
busco -i $Genome_prefix.hic.p.fasta -o busco_camelea -l eukaryota -c 8 -m geno -f 
busco -i $Genome_prefix.hic.p.fasta -o busco_camelea -l metazoa -c 8 -m geno -f 
busco -i $Genome_prefix.hic.p.fasta -o busco_camelea -l mollusca -c 8 -m geno -f 

busco -i $Genome_prefix.hic.a.fasta -o busco_camelea -l eukaryota -c 8 -m geno -f 
busco -i $Genome_prefix.hic.a.fasta -o busco_camelea -l metazoa -c 8 -m geno -f 
busco -i $Genome_prefix.hic.a.fasta -o busco_camelea -l mollusca -c 8 -m geno -f 
```

## merqury

```bash
meryl k=21 count output reads1.meryl DNA_short_1.fq
meryl k=21 count output reads2.meryl DNA_short_2.fq
meryl union-sum output genome.meryl read*.meryl
## run merqury
merqury.sh genome.meryl primary.fasta alternate.fasta final
```
