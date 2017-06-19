
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(datasets)

shinyServer(function(input, output) {
  data("chickwts")
  
  selectedChicks <- reactive({
    chickwts[chickwts$feed %in% input$Feeds,]
  })
  
  selectedChicksMean <- reactive({
    mean(chickwts[chickwts$feed %in% input$Feeds,]$weight)
  })

  output$chickPlot <- renderPlot({

    # generate box plot of selected chick weight data
    chickdata <- selectedChicks()
    chickdata$feed <- droplevels(chickdata$feed)
    if (length(chickdata) > 0) {
      boxplot(weight ~ feed, data=chickdata, xlab = "Feed Type", ylab="Chick Weight (gm)", main="Chick Weight by Feed Type", col=c("blue","green"))
      if (input$chickMean) {
        abline(h=mean(chickdata$weight))
      }
    }
  })
  
  
  output$chickWeight <- renderText({
    if (input$chickMean) {
      paste("Mean chick weight at 6 wks: ", selectedChicksMean())
    }
  })

})
