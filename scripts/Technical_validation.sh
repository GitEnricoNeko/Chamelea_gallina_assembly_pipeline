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

