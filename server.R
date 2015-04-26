library(shiny)
library(datasets)

## start of first time setup
#load mtcars
data(mtcars)
#fit a linear regression model based on mpg, hp, wt, am, cyl
fit <- lm(mpg ~ hp + wt + factor(am) + factor(cyl), data=mtcars)
## end of first time setup

shinyServer( function(input, output) {
  
  # Generate an HTML table view of the input data
  output$inputTable <- renderTable({
    data.frame("hp"=input$horsepower,"wt"=input$weight,"cyl"=input$cylinder,"am"=input$am)
  })
  
  # Create a dynamic prediction based on the fitted regression model (fit) and the input values
  output$predictionTable <- renderTable({
    data.frame("mph"=predict(fit,data.frame("hp"=input$horsepower,"wt"=input$weight,"cyl"=input$cylinder,"am"=input$am)))
  })
}
)