
## NHS Pathways ##
import_pathways <- function() {
  rio::import(current_pathways, "rds")
}

## NHS online deaths ##
import_deaths <- function() {
  rio::import(current_deaths, "rds")
}
