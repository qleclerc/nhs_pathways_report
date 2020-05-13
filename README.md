
## Introduction

This repository contains a
[reportfactory](https://github.com/reconhub/reportfactory) automating the
production of routine results for the analysis of potential COVID-19 symptoms
reported through England **NHS Pathways**.

The **NHS Pathways** dataset describes potential COVID-19 symptoms reported in 
England through 111 and 999 calls, and 111 online reports. It is updated 
daily (except weekends), and is freely available via the [NHS Digital website](https://digital.nhs.uk/data-and-information/publications/statistical/mi-potential-covid-19-symptoms-reported-through-nhs-pathways-and-111-online/latest).



<br>
<img src="data/images/line_bubbles.png" alt="line">



## Initial setup

When initialising the reportfactory, you can load all dependencies using:

``` r
## install dependencies (if first time running)
source("scripts/install_devel_packages.R")
reportfactory::install_deps()

``` 


<br>
<img src="data/images/line_bubbles.png" alt="line">



## Loading the latest extracted datasets

### Loading the latest extracted NHS Pathways dataset

When working within this reportfactory, the latest extracted **NHS Pathways** 
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
in `current_pathways`, and the file can be read directly using `readRDS()` or
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

### Loading other datasets

The repository also contains COVID-19 daily **deaths** in England, by NHS region,
extracted from the [NHS website](https://www.england.nhs.uk/statistics/statistical-work-areas/covid-19-daily-deaths/).

As with **NHS Pathways** data, the **deaths** data can be extracted using a helper function,
or read directly using `readRDS()` or `rio::import()`

```r
## load the global factory scripts
reportfactory::rfh_load_scripts()

## load the latest extracted deaths dataset
deaths <- import_deaths()
deaths

## use the path to the latest extracted deaths dataset to read the file
current_deaths

deaths <- readRDS(current_deaths)
deaths

deaths <- rio::import(current_deaths)
deaths

```



<br>
<img src="data/images/line_bubbles.png" alt="line">



## Compiling the analysis

### Generating the figures 

The initial analysis can be locally compiled using the
`nhs_pathways_analysis_2020-05-13.Rmd` report in the `report_sources/`
folder. 

```r
reportfactory::compile_report("nhs_pathways_analysis_2020-05-13.Rmd")
```

All outputs will be generated in the `report_outputs/` folder, classified
by report name (including the date of the report source, not of the
compilation), and then by date and time of compilation.

These outputs are then used to update the clean report.


### Generating the report 

Once the initial analysis has been locally compiled, the report can be 
generated using the `nhs_pathways_report_2020-05-13.Rmd` report in the
`report_sources/` folder. 

```r
reportfactory::compile_report("nhs_pathways_analysis_2020-05-13.Rmd")
```

Again, all outputs will be generated in the `report_outputs/` folder,
including the pdf report.




<br>
<img src="data/images/line_bubbles.png" alt="line">




## Locally updating datasets

### Updating the NHS Pathways dataset

If you wish to locally extract and clean the latest version of the
**NHS Pathways** data from the NHS website, this can be achieved with
the `clean_latest_pathways_2020-05-13.Rmd` report, in the
`report_sources/` folder. The report can be compiled using:

```r
reportfactory::compile_report("clean_latest_pathways_2020-05-13.Rmd")
```


### Updating the deaths dataset

Similarly, the **deaths** dataset can also be locally updated using the
`clean_latest_deaths_2020-05-13.Rmd` report.

```r
reportfactory::compile_report("clean_latest_deaths_2020-05-13.Rmd")
```


<br>
<img src="data/images/line_bubbles.png" alt="line">


