library(shiny)

shinyUI( pageWithSidebar(
  
  # Application title 
  headerPanel("Miles Per Hour (mph) Prediction by Eotoke"),
  
  sidebarPanel(
    #side bar with input controls for hp, wt, am and cyl
    #br is used for spacing between input controls
    numericInput("horsepower", "Select Vehicle Horsepower (hp):", 
                 90, min = 50, max = 360, step = 1), 
    br(),
    numericInput("weight", "Select Vehicle Weight lb/1000 (wt):", 
                 3, min = 1, max = 6, step = .1), 
    br(),
    radioButtons("am","Select Vehicle Transmission (am):",
                 c("Automatic (0)"=0,"Manual (1)"=1)),
    br(),
    radioButtons("cylinder","Select Number Of Cylinders (cyl):",
                 c("4"=4,"6"=6,"8"=8))
  ), 
  mainPanel(
    h3("Instructions:"),
    p("Using linear regression on mtcars dataset, this application demonstrates and predicts how mpg changes with the 4 key variables (hp, wt, am, cyl).
      To see the prediction, please adjust the values in the side bar accordingly."),
    br(),
    h3("Results of Miles Per Hour (mph) prediction"),
    h4("You entered:"),
    #printing the input table
    tableOutput("inputTable"),
    h4("Which resulted in a mph prediction of :"), 
    #printing the prediction
    tableOutput("predictionTable")
  )
  )
)