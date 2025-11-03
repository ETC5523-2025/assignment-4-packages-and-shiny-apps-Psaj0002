library(shiny)
library(ggplot2)
library(dplyr)

# Load dataset (use relative path for testing)
load("../../data/covid_data.rda")

ui <- fluidPage(
  # ---- Custom Styling ----
  tags$head(
    tags$style(HTML("
      body {
        background-color: #f8fafc;
        font-family: 'Helvetica Neue', sans-serif;
        color: #1e293b;
      }
      h2, h3 {
        color: #003366;
      }
      .well {
        background-color: #e7eef7;
        border: none;
      }
      .sidebar {
        background-color: #e6eef5;
        padding: 15px;
        border-radius: 8px;
      }
    "))
  ),

  titlePanel("COVID-19 Outbreak Risk Explorer"),

  sidebarLayout(
    sidebarPanel(
      div(class = "sidebar",

          h3("Explore the Data"),

          selectInput(
            inputId = "variant",
            label = "Select Variant:",
            choices = sort(unique(covid_data$variant)),
            selected = unique(covid_data$variant)[1]
          ),

          selectInput(
            inputId = "xvar",
            label = "Select X-axis variable:",
            choices = c("vaccination_rate", "vaccine_efficacy", "testing_freq_days", "R0"),
            selected = "vaccination_rate"
          ),

          selectInput(
            inputId = "yvar",
            label = "Select Y-axis variable:",
            choices = c("outbreak_risk", "R0", "vaccine_efficacy"),
            selected = "outbreak_risk"
          ),

          hr(),
          h4("Field Descriptions"),
          p("• variant: COVID-19 strain (e.g., Wildtype, Delta, Omicron)."),
          p("• vaccination_rate: Proportion of the population vaccinated."),
          p("• vaccine_efficacy: Effectiveness of vaccine in preventing infection."),
          p("• testing_freq_days: Average interval between population testing (in days)."),
          p("• R0: Basic reproduction number — average number of secondary infections."),
          p("• outbreak_risk: Probability of an outbreak given conditions.")
      )
    ),

    mainPanel(
      h2("Interactive Relationship Plot"),
      plotOutput("scatterPlot", height = "450px"),
      hr(),
      h3("How to Interpret the Output"),
      p("This plot shows how one variable (on the x-axis) affects another (on the y-axis)
         for a chosen COVID variant. For example, you can explore how vaccination rate
         influences outbreak risk across variants. A downward trend indicates a mitigating effect,
         while an upward trend suggests higher outbreak potential.")
    )
  )
)

server <- function(input, output) {

  filtered_data <- reactive({
    covid_data |>
      filter(variant == input$variant)
  })

  output$scatterPlot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = input$xvar, y = input$yvar)) +
      geom_point(color = "#0073C2FF", size = 3, alpha = 0.7) +
      geom_smooth(method = "lm", se = FALSE, color = "#003366", linewidth = 1) +
      labs(
        title = paste("Relationship between", input$xvar, "and", input$yvar, "for", input$variant),
        x = input$xvar,
        y = input$yvar
      ) +
      theme_minimal(base_size = 14) +
      theme(
        plot.background = element_rect(fill = "#f8fafc", color = NA),
        panel.grid.major = element_line(color = "#d0d9e6"),
        axis.title = element_text(face = "bold")
      )
  })
}

# Return the app object
shinyApp(ui = ui, server = server)
