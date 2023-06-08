library(shiny)
library(shinyWidgets)
library(tidyverse)
library(shinythemes)

ideas <- read.csv("Ideas.csv")
ideas <- ideas[-1, ]

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = shinytheme("superhero"),
  tags$head(
    includeHTML("www/tags.html"),
    tags$link(
      rel = "shortcut icon", href = "favicon.ico"
    )
  ),

  # Application title
  fluidRow(
    column(
      width = 4, align = "center", offset = 4,
      br(),
      br(),
      titlePanel("Date Night Generator"),
      br(),
      img(src = "datenight.gif"),
      br(),
      br(),
      actionBttn(
        inputId = "generate",
        label = "Get Idea",
        icon = icon(name = "calendar"),
        style = "unite",
        color = "royal"
      ),
      br(),
      br(),
      span(textOutput(outputId = "idea"),
        style = "font-size:20px; font-family:arial; font-style:italic; color:white"
      )
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$idea <- eventReactive(input$generate,
    {
      sample(ideas, 1, replace = TRUE)
    },
    ignoreInit = TRUE
  )
}

# Run the application
shinyApp(ui = ui, server = server)
