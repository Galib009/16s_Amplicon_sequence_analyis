#!/bin/bash

# We have to install qiime first in a new conda environment and then follow this -- 

# Activating conda environment -->

	conda activate qiime2-2022.2
	
# some basic -
#qiime tools view stats-dada2.qzv

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path 15_samples \ # input folder name here
  --input-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path demux.qza

# checking sample sequences numbers and and quality of R1 and R2 ---->

qiime demux summarize \
  --i-data demux.qza \
  --o-visualization 15_samples-summary-1.qzv


# look at the quality of the sequence and decide how much sequence you are going to keep???

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 13 \
  --p-trim-left-r 13\
  --p-trunc-len-f 150 \
  --p-trunc-len-r 150 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

# making feature able - 

qiime feature-table summarize \
  --i-table table.qza \
  --o-visualization table.qzv \
  --m-sample-metadata-file sample-metadata.tsv

qiime feature-table tabulate-seqs \
  --i-data rep-seqs.qza \
  --o-visualization rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file denoising-stats.qza \
  --o-visualization denoising-stats.qzv

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza
  
  
qiime diversity core-metrics-phylogenetic \
  --i-phylogeny rooted-tree.qza \
  --i-table table.qza \
  --p-sampling-depth 16971 \
  --m-metadata-file sample-metadata.tsv \
  --output-dir core-metrics-results
  
  
qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column pd_and_t \
  --o-visualization core-metrics-results/unweighted-unifrac-body-site-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column subject \
  --o-visualization core-metrics-results/unweighted-unifrac-subject-group-significance.qzv \
  --p-pairwise
