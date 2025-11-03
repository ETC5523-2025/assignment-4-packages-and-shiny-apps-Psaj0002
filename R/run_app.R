#' Launch the Shiny App
#'
#' This function launches the COVID-19 Outbreak Risk Explorer Shiny app
#' included in the CovidDataPackage1 package.
#'
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "CovidDataPackage1")
  shiny::runApp(app_dir, display.mode = "normal")
}
