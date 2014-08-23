library(shiny)

source("venn.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$venn <- renderPlot({
    set1 <- unique(unlist(strsplit(input$set1, "\n")))
    set2 <- unique(unlist(strsplit(input$set2, "\n")))
    set3 <- unique(unlist(strsplit(input$set3, "\n")))

    set1name <- input$set1name
    set2name <- input$set2name
    set3name <- input$set3name

    if (length(set1) > 0 & length(set2) > 0) {
      print(plotVenn2(set1, set2, set1name, set2name))
    }

    if (length(set1) > 0 & length(set2) > 0 & length(set3) > 0) {
      print(plotVenn3(set1, set2, set3, set1name, set2name, set3name))
    }
    
  })
})
