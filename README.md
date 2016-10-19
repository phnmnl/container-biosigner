<!-- Guidance:
Logo: The logo needs have the text "Logo" inside the square bracket place holder to be recognized at the App Library.
Tool name: First single hashtag (#) will be taken as tool name.
Version: Should always go after the first hastag and before the second hastag. The line needs to respond to the regexp "^Version: (.+)" being the first group the actual version.

Fields: for the App Library, the following fields will be parsed:

# Name of the tool
Version: z.x-whatever
## Short description
## Description
## Key features
## Publications
## Screenshots
## Tool Authors 
- Author 1 and affiliation
- [Author 2](link_to_author_2) and affiliation
## Container Contributors
- Contributor 1
- [Contributor 2](link_to_contributior_2) and affiliation
## Website
## Usage Instructions

Free text with triple tick code blocks, comprising docker, ipython and galaxy usage

## Installation 

They all have to be at the second hashtag level

For screenshots, you should use the following scheme:

![screenshot](screenshots/s1.gif)
![screenshot](screenshots/s2.gif)

-->
![Logo](w4m.png)

# W4M Biosigner
Version: 2.2.6

## Short description

<!-- 
This should only be 20 to 40 words, hopefully a single sentence.
-->

Discovery of significant signatures from omics data.

## Description

High-throughput technologies such as transcriptomics, proteomics, and metabolomics show great promise for the discovery of biomarkers for diagnosis and prognosis. Selection of the most promising candidates between the initial untargeted step and the subsequent validation phases is critical within the pipeline leading to clinical tests. Several statistical and data mining methods have been described for feature selection: in particular, wrapper approaches iteratively assess the performance of the classifier on distinct subsets of variables. Current wrappers, however, do not estimate the significance of the selected features. We therefore developed a new methodology to find the smallest feature subset which significantly contributes to the model performance, by using a combination of resampling, ranking of variable importance, significance assessment by permutation of the feature values in the test subsets, and half-interval search. We wrapped our biosigner algorithm around three reference binary classifiers (Partial Least Squares-Discriminant Analysis, Random Forest, and Support Vector Machines) which have been shown to achieve specific performances depending on the structure of the dataset. By using three real biological and clinical metabolomics and transcriptomics datasets (containing up to 7000 features), complementary signatures were obtained in a few minutes, generally providing higher prediction accuracies than the initial full model. Comparison with alternative feature selection approaches further indicated that our method provides signatures of restricted size and high stability. Finally, by using our methodology to seek metabolites discriminating type 1 from type 2 diabetic patients, several features were selected, including a fragment from the taurochenodeoxycholic bile acid. Our methodology, implemented in the biosigner R/Bioconductor package and Galaxy/Workflow4metabolomics module, should be of interest for both experimenters and statisticians to identify robust molecular signatures from large omics datasets in the process of developing new diagnostics.

## Key features

- Omics signatures.

## Metabolomics Technologies

- Omics

## Data Analysis

- Statistics.

## Screenshots

 TODO

## Tool Authors

 TODO
- Étienne Thévenot (CEA).

## Container Contributors

- Pierrick Roger (CEA).

## Website

- http://workflow4metabolomics.org

## Git Repository

- https://github.com/phnmnl/container-biosigner.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/biosigner
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/biosigner ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
-->

- TODO
 - Determan C. (2015). Optimal algorithm for metabolomics classification and feature selection varies by dataset. International *Journal of Biology* 7, 100-115.
 - Gromski P.S., Xu Y., Correa E., Ellis D.I., Turner M.L. and Goodacre R. (2014). A comparative investigation of modern feature selection and classification approaches for the analysis of mass spectrometry data . *Analytica Chimica Acta* 829, 1-8.
 - Guyon I. and Elisseeff A. (2003). An introduction to variable and feature selection. *Journal of Machine Learning Research* 3, 1157-1182.
 - Rifai N., Gillette M.A. and Carr S.A. (2006). Protein biomarker discovery and validation: the long and uncertain path to clinical utility. *Nature Biotechnology* 24, 971-983.
 - Rinaudo P., Junot C. and Thevenot E.A. *biosigner*: A new method for the discovery of restricted and stable molecular signatures from omics data. *submitted*.
 - Saeys Y., Inza I. and Larranaga P. (2007). A review of feature selection techniques in bioinformatics. *Bioinformatics* 23, 2507-2517.
