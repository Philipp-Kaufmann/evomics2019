# load shiny library
library(shiny)

# set up back end
shinyServer(function(input, output) {
  # load the data
  amlData <- read.delim("data/shinyExampleData.tsv")
  
  # construct a plot to show the data
  library(ggplot2)
  output$scatterPlot <- renderPlot({
    p1 <- ggplot(data = amlData, aes_string(x = input$x_axis, y = input$y_axis, color = input$color))+
      geom_point()
    p1 <- p1 + xlab('vaf_lööpsx') + ylab('vaf_lööpsy')
    p1
  })
  output$lööps_xy <- renderText({HTML(paste0('please choose your lööps coordinates'))})
  output$lööps_color <- renderText({HTML(paste0('please choose the color of your lööps'))})
  output$LÖÖPS_TITLE <- renderText({HTML(paste0('LÖÖPS'))})
})