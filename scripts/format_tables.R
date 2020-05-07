
kable_tab <- function(x){
  kableExtra::kable(x) %>% 
  kableExtra::kable_styling(bootstrap_options =
                            c("striped", "hover", "condensed", "responsive"))
}



## wrapper for datatable; if params$light is TRUE, then we disable the tables
dt_tab <- function(x, params = NULL, ...) {
  if (!is.null(params)) {
    if (isTRUE(params$light))  return(NULL)
  }
  ## print(x, ...)
  DT::datatable(x,
                rownames = FALSE,
                options = list(scrollX = TRUE), ...)
}

