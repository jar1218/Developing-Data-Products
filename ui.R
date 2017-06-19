
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Analysis of the Effect of Feed Type on Chick Growth"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      p("This dataset contains weights for 171 chicks fed one of six feeds"),
      checkboxGroupInput("Feeds", "Feeds to include in the analysis:", 
              c("casein", "meatmeal", "sunflower", "soybean", "linseed", "horsebean"), c("casein", "meatmeal", "sunflower", "soybean", "linseed", "horsebean")),
      br(),
      checkboxInput("chickMean", "Show mean weight for all selected feeds", TRUE),
    
    submitButton()
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("chickPlot"),
      textOutput("chickWeight")
    )
  )
))
