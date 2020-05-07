
## NHS Pathways ##
import_pathways <- function() {
  rio::import(current_pathways, "rds")
}
