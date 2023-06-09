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
  HTML('<!-- HTML Meta Tags -->
<title>Date Night Generator</title>
<meta name="description" content="Spice up your life with random date ideas. ">

<!-- Google / Search Engine Tags -->
<meta itemprop="name" content="Date Night Generator">
<meta itemprop="description" content="Spice up your life with random date ideas. ">
<meta itemprop="image" content="https://media.tenor.com/wIa91mot0tAAAAAd/pixel-city-chill.gif">

<!-- Facebook Meta Tags -->
<meta property="og:url" content="https://aholmes24.shinyapps.io/Rando_Date_Ideas">
<meta property="og:type" content="website">
<meta property="og:title" content="Date Night Generator">
<meta property="og:description" content="Spice up your life with random date ideas. ">
<meta property="og:image" content="https://media.tenor.com/wIa91mot0tAAAAAd/pixel-city-chill.gif">

<!-- Twitter Meta Tags -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:url" content="https://aholmes24.shinyapps.io/Rando_Date_Ideas/">
<meta name="twitter:title" content="Date Night Generator">
<meta name="twitter:description" content="Spice up your life with random date ideas. ">
<meta name="twitter:image" content="https://media.tenor.com/wIa91mot0tAAAAAd/pixel-city-chill.gif">
'),
    tags$link(
      rel = "shortcut icon", href = "favicon.ico"
    )
  ),

  # Application title
  fluidRow(
    column(
      width = 12, align = "center",
      br(),
      br(),
      titlePanel("Date Night Generator"),
      br(),
      div(img(src = "datenight.gif"),style = "text-align: center;"),
      br(),
      br(),
      actionBttn(
        inputId = "generate",
        label = "Get Idea",
        icon = icon(name = "lightbulb"),
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
