library(shiny)
library(ggplot2)
library(stringr)

#setwd("/Users/Steven/stat159-fall2016-labs/lab08")
data = read.csv("Advertising.csv")

ui = fluidPage(
  selectInput(inputId = 'variable', 
              label = "Choose a variable", 
              choices = c("TV", "Radio", "Newspaper")),
  plotOutput("scatterplot")
)

server = function(input, output) {
  output$scatterplot <- renderPlot({ plot(data$Sales ~ data[,input$variable], 
                                          data = data, 
                                          xlab = "Variable of Interest", 
                                          ylab = 'Sales') })
}

shinyApp(server=server, ui=ui)