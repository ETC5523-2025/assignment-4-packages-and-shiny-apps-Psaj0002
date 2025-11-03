## code to prepare `covid_data` dataset goes here
# Replicated & expanded data based on Zachreson et al. (2021)
set.seed(35571381)

n = 60
variant = sample(c("Wildtype", "Alpha", "Delta"), n, replace = TRUE, prob = c(0.3, 0.3, 0.4))
vaccination_rate = round(runif(n, 0.2, 1.0), 2)          # proportion of population vaccinated
vaccine_efficacy = round(runif(n, 0.5, 0.9), 2)          # vaccine efficacy against transmission
testing_freq_days = sample(c(3, 5, 7), n, replace = TRUE) # days between tests

# Assign R0 values by variant (from paper)
R0 = ifelse(variant == "Wildtype", runif(n, 2.3, 2.7),
            ifelse(variant == "Alpha", runif(n, 3.0, 3.8),
                   runif(n, 5.0, 6.0)))

# Model outbreak risk roughly increasing with R0 and decreasing with vaccination & testing
outbreak_risk = pmin(1,
                     0.15 * (R0 / 2.5) * (1 - vaccination_rate * vaccine_efficacy) *
                       (testing_freq_days / 5)
)
outbreak_risk = round(outbreak_risk, 3)

covid_data = data.frame(
  variant,
  vaccination_rate,
  vaccine_efficacy,
  testing_freq_days,
  R0,
  outbreak_risk
)



usethis::use_data(covid_data, overwrite = TRUE)
