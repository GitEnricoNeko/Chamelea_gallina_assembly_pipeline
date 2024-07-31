
# Primary Assembly

```bash
hifiasm -o Cgal -t32 --h1 bgi_17Jul24_camelea_hic/F24A910000005-02_GALklesD/Clam_tissue-5A/clam_hic_1.fq --h2 bgi_17Jul24_camelea_hic/F24A910000005-02_GALklesD/Clam_tissue-5A/clam_hic_2.fq data.fastq.gz -s 0.35 --primary > hifi_assembly_hic_primary.log 2>&1 &
```

# Quality Control

```bash
busco -i Cgal.hic.p.fasta -o busco_camelea -l metazoa -c 8 -m geno -f
```

# Running Purge_Dups:

## Map Reads to Assembly and Assembly to Self

```bash
$purge_dups_path/split_fa input.fasta > split.fasta

minimap2 -I 200G -t 24 -xasm5 -DP split.fasta split.fasta > split.genome.paf
minimap2 -I 200G -x map-pb -t 24 split.fasta reads.ccs.fastq.gz > reads.paf
```

## Calculate Haploid/Diploid Coverage Threshold and Remove Haplotype Duplicates from Assembly

```bash
$purge_dups_path/pbcstat -O coverage reads.paf

$purge_dups_path/calcuts PB.stat > cutoffs

$purge_dups_path/purge_dups -2 -c PB.base.cov -T cutoffs split.genome.paf > dups.bed

$purge_dups_path/get_seqs -e -p asm_mTadBra.purged dups.bed input.fasta
```
