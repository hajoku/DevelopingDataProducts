library(shiny)
shinyUI(pageWithSidebar(
  mainPanel(
    h1("Diamonds: Explore the connection between carat, cut, clarity, color and price"),
    h4("This shiny page allowes you to explore the correlation between price and carat for diamonds. 
       You can filter for diamond clarity, cut and weight on the left side.
       On the right side, you see the filtered data and a linear model for each diamond color")
  ),
  sidebarPanel(
    h3("Parameters"),
    selectInput("cut", label = h3("Cut"), choices = list("Fair"="Fair","Good"="Good","Very Good"="Very Good","Premium"="Premium","Ideal"="Ideal"),selected = "Ideal"), 
    selectInput("clarity", label = h3("Clarity"), choices = list("I1"="I1","SI2"="SI2","SI1"="SI1","VS2"="VS2","VS1"="VS1","VVS2"="VVS2","VVS1"="VVS1","IF"="IF"),selected = "VS2"), 
    sliderInput('min_w','minimum weight',value = 2, min  = 0, max = 5.2, step = 0.1),
    sliderInput('max_w','maximum weight',value = 4, min  = 0, max = 5.2, step = 0.1)
  ),
  mainPanel(
    h3("Price vs Carat"),
    plotOutput('priceplot')
  )
))
