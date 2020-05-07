
## Introduction

This repository contains a
[reportfactory](https://github.com/reconhub/reportfactory) automating the
production of routine results for the analysis of potential COVID-19 symptoms
reported through England **NHS Pathways**.

The **NHS Pathways** dataset describes potential COVID-19 symptoms reported in 
England through 111 and 999 calls, and 111 online assessments. It is updated 
daily (except weekends), and is freely available via the [NHS Digital website](https://digital.nhs.uk/data-and-information/publications/statistical/mi-potential-covid-19-symptoms-reported-through-nhs-pathways-and-111-online/latest).


<br>
<img src="data/images/line_bubbles.png" alt="line">


## Initial setup

When initialising the report factory, you can load all dependencies using:

``` r
## install dependencies (if first time running)
source("scripts/install_devel_packages.R")
reportfactory::install_deps()

``` 


<br>
<img src="data/images/line_bubbles.png" alt="line">


## Loading the latest extracted NHS Pathways dataset

When working within this report factory, the latest extracted **NHS Pathways** 
dataset can be loaded using a helper function. After loading the global factory
scripts (in `scripts/`) using `reportfactory::rfh_load_scripts()`, the data can 
be loaded with `import_pathways()`:

```r
## load the global factory scripts
reportfactory::rfh_load_scripts()

## load the latest extracted NHS Pathways dataset
pathways <- import_pathways()
pathways

```

Alternatively, the path to the latest extracted **NHS Pathways** data is stored
in `current_pathways`, and the file can be read directly using `readRDS` or
`rio::import()`:


```r
## load the global factory scripts
reportfactory::rfh_load_scripts()

## use the path to the latest extracted NHS Pathways dataset to read the file
current_pathways

pathways <- readRDS(current_pathways)
pathways

pathways <- rio::import(current_pathways)
pathways

```


<br>
<img src="data/images/line_bubbles.png" alt="line">


## Updating the NHS Pathways dataset

Importing and cleaning the latest version of the **NHS Pathways** data is automated by the `clean_latest_pathways.Rmd` report, in the `report_sources/` folder.


```r
reportfactory::compile_report("aaa_clear_pathways_2020-04-14.Rmd")
```


If new data come in, updating all reports will encrypt the new data, clean them,
and run all analyses using the new data. This can be achieved by typing:

```{r }
reportfactory::update_reports(clean_report_sources = TRUE)
```

All outputs will be generated in `report_outputs`, classified by report name
(including the date of the report source, not of the compilation), and then by
date and time of compilation.



<br>
<img src="data/images/line_bubbles.png" alt="line">


