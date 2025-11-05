#' covid_data
#'
#' A simulated dataset containing disease transmission parameters and outbreak risk
#' measures for different COVID-19 variants. This dataset supports the
#' COVID-19 Outbreak Risk Explorer Shiny app included in the package.
#'
#' @format A data frame with 60 rows and 7 variables:
#' \describe{
#'   \item{variant}{COVID-19 variant (e.g., Wildtype, Delta, Omicron).}
#'   \item{vaccination_rate}{Proportion of the population vaccinated.}
#'   \item{vaccine_efficacy}{Effectiveness of the vaccine in preventing infection.}
#'   \item{testing_freq_days}{Average number of days between population testing.}
#'   \item{R0}{Basic reproduction number,i.e, the average number of secondary infections
#'   caused by one infected person.}
#'   \item{outbreak_risk}{Simulated probability of a COVID-19 outbreak under
#'   given conditions.}
#'
#' @details
#' The dataset was created to demonstrate how disease transmission parameters interact
#' to affect outbreak potential across variants. It is used within the Shiny app
#' `CovidDataPackage1::run_app()` to generate interactive visualizations.
#'
#' @examples
#' data("covid_data", package = "CovidDataPackage1")
#' head(covid_data)
#'
#' @source Simulated dataset based on model parameters described in Zachreson et al. (2021),
#' "A model of COVID-19 quarantine and outbreak risk in Australia".
"covid_data"
