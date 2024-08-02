
## Primary Assembly

```bash
hifiasm -o Cgal -t32 --h1 bgi_17Jul24_camelea_hic/F24A910000005-02_GALklesD/Clam_tissue-5A/clam_hic_1.fq --h2 bgi_17Jul24_camelea_hic/F24A910000005-02_GALklesD/Clam_tissue-5A/clam_hic_2.fq Hifi.data.fastq.gz -s 0.35 --primary > hifi_assembly_hic_primary.log 2>&1 &
```

## Quality Control

```bash
busco -i Cgal.hic.p.fasta -o busco_camelea -l metazoa -c 8 -m geno -f
```

## Running Purge_Dups:

### Map HiFi Reads to Assembly and Assembly to itself

```bash
minimap2 -x map-hifi -t 28 Cgal.hic.p.fasta Hifi.data.fastq.gz > Chamelea_Hifi.paf

$purge_dups_path/split_fa Cgal.hic.p.fasta > split.fasta

minimap2 -I 200G -t 24 -xasm5 -DP split.fasta split.fasta > split.genome.paf
```

### Calculate Haploid/Diploid Coverage Threshold and Remove Haplotype Duplicates from Assembly

```bash
$purge_dups_path/pbcstat Chamelea_Hifi.paf

$purge_dups_path/calcuts PB.stat > cutoffs 2>calcults.log

$purge_dups_path/purge_dups -2 -T cutoffs -c PB.base.cov split.genome.paf > dups.bed 2> purge_dups.log

$purge_dups_path/get_seqs dups.bed Cgal.hic.p.fasta
```
