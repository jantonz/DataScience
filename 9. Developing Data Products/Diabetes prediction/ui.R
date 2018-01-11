library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Illustrating inputs"),
  sidebarPanel(
    numericInput("glucose", "Glucose mg/L", 90, min = 50, max = 200, step = 5),
    submitButton("Submit")
      ),
  mainPanel(
    h3("Results of prediction"),
    h4("You entered"),
    verbatimTextOutput("inputValue"),
    h4("Which resulted in a prediction of "),
    verbatimTextOutput("prediction")
  )
))