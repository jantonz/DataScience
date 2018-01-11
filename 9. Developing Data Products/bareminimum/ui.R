library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Illustrating inputs"),
  sidebarPanel(
    h1("H1 Sidebar panel"),
    numericInput("id1", "Numeric input labeled id1", 0, min=0, max=10, step=1),
    h2("H2 text"),
    h3("H3 text"),
    h4("H4 text"),
    checkboxGroupInput("id2", "Checkbox", c("Value 1" = "1",
                                            "Value 2" = "2",
                                            "Value 3" = "3")),
    dateInput("date", "Date:")
  ),
  mainPanel(
    h3("Illustrating outputs"),
    h4("You entered"),
    verbatimTextOutput("oid1"),
    h4("You entered"),
    verbatimTextOutput("oid2"),
    h4("You entered"),
    verbatimTextOutput("odate"),
    p("some ordinary text")
  )
))