# 16s Amplicon Sequencing Analysis
16s amplicon sequence analysis of stools samples from patients having persistent Diarrhea and three different nutrient intervention at multiple points in time.


 - Sequence quality control and feature table construction using [DADA2](https://pubmed.ncbi.nlm.nih.gov/27214047/) -
 
    DADA2 is a pipeline for detecting and correcting (where possible) Illumina amplicon sequence data.
 - Generation of a tree for phylogenetic diversity analyses - 

    QIIME supports several phylogenetic diversity metrics, including Faith’s Phylogenetic Diversity and weighted and unweighted UniFrac.
 - Alpha and beta diversity analysis -

    The metrics computed by default are

    Alpha diversity

        Shannon’s diversity index (a quantitative measure of community richness)

        Observed Features (a qualitative measure of community richness)

        Faith’s Phylogenetic Diversity (a qualitative measure of community richness that incorporates phylogenetic relationships between the features)

        Evenness (or Pielou’s Evenness; a measure of community evenness)

    Beta diversity

        Jaccard distance (a qualitative measure of community dissimilarity)

        Bray-Curtis distance (a quantitative measure of community dissimilarity)

        unweighted UniFrac distance (a qualitative measure of community dissimilarity that incorporates phylogenetic relationships between the features)

        weighted UniFrac distance (a quantitative measure of community dissimilarity that incorporates phylogenetic relationships between the features)

- Taxonomic analysis-

    This allows us to assess what organisms are present in the samples.
