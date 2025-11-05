#' Launch the COVID-19 Outbreak Risk Explorer App
#'
#' This function launches the interactive Shiny application included
#' with the **CovidDataPackage1** package. The app visualizes how
#' public-health variables like vaccination rate, vaccine efficacy,
#' testing frequency, and virus transmissibility (R₀) influence the
#' probability of a COVID-19 outbreak under different variant scenarios.
#'
#' The app uses the dataset \code{\link{covid_data}} to generate
#' dynamic plots that help users explore relationships between variables
#' and understand outbreak dynamics across variants.
#'
#' ### Features
#' - Interactive selection of COVID variant, x-axis, and y-axis variables.
#' - Real-time visualization with regression trend lines.
#' - Built-in descriptions and interpretation guidance.
#' - Clean, professional styling for clear data communication.
#'
#' ### Example
#' ```r
#' # Launch the Shiny app
#' CovidDataPackage1::run_app()
#' ```
#'
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "CovidDataPackage1")
  shiny::runApp(app_dir, display.mode = "normal")
}
