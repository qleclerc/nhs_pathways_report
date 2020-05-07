
# Welcome to the CMMID automated COVID-19 reports

This repository contains a
[reportfactory](https://github.com/reconhub/reportfactory) automating the
production of routine results for the analysis of **UK linelists** of the COVID-19 outbreak.



<br>
<img src="data/images/line_bubbles.png" alt="line">



* **UK NHS Pathways data**: daily data on potential COVID-19 symptoms reported 
   through 111 and 999 calls, and 111 online reports (this is a non-encrypted dataset,
   see [non-encrypted data section](#using-clear-non-encrypted-data) (below) for access instructions)




### Cleaning data

Data cleaning is automated by the reports `aaa_clean_ff100`, `aaa_clean_sitrep`,
`aaa_clean_linelist`, `aaa_clean_death`, `aaa_clean_rcgp`, and `aaa_clean_chess`.
The recommended procedure to generate new clean data is:


```r

reportfactory::compile_report("aaa_clear_pathways_2020-04-14.Rmd")

```





### Updating all reports

If new data come in, updating all reports will encrypt the new data, clean them,
and run all analyses using the new data. This can be achieved by typing:

```{r }
reportfactory::update_reports(clean_report_sources = TRUE)
```

All outputs will be generated in `report_outputs`, classified by report name
(including the date of the report source, not of the compilation), and then by
date and time of compilation.



* **UK NHS Pathways data**: daily data on potential COVID-19 symptoms reported 
   through 111 and 999 calls, and 111 online reports.

The helper functions are only available when working within the report
factory. After loading the global factory scripts (in `scripts/`) using
`rfh_load_scripts()`, latest clear data can be loaded using custom functions,
**without** the user needing a *data key*:

```r
source("scripts/install_devel_packages.R")
reportfactory::install_deps()
reportfactory::rfh_load_scripts()

## get nhs pathways (clear)
pathways <- import_clear_pathways()
pathways

```



<br>
<img src="data/images/line_bubbles.png" alt="line">



### Access to non-encrypted data

We also produce non-encrypted data as `rds` files, which are typically a version
of existing encrypted data aggregated by NHS regions. These are indicated by the
keyword `clear` in the file name. A list of currently available `clear` datasets 
is provided in the [non-encrypted data section](#using-clear-non-encrypted-data)
(above). These files can be read directly using `readRDS` or `rio::import()` and
do not require a data key.
