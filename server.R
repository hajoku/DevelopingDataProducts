library(shiny)
library(ggplot2)
data(diamonds)
shinyServer(
  function(input,output) {
    output$color <- renderPrint({input$color})
    subset = reactive({diamonds$carat > input$min_w& diamonds$carat < input$max_w & diamonds$cut == input$cut & diamonds$clarity == input$clarity})
    output$priceplot <- renderPlot({
      qplot(carat, price, data = diamonds[subset(),],
            colour = color, geom = c("point", "smooth"),method = "lm")})
  }
)