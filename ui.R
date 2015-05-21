library(shiny)
#library(rCharts)

# Shiny UI
today <- Sys.Date()
shinyUI(pageWithSidebar(
  headerPanel("R Stock Charts"),
            sidebarPanel(
              h3('Chart Controls'),
              textInput(label="Enter Stock Symbol:", inputId="symbol", "AAPL"),
              dateInput(label="Starting Date", inputId="startDate", min="2008-01-01", "2015-01-01"),
              dateInput(label="Ending Date", inputId="endDate", min="2008-01-01", today),
              checkboxGroupInput(label=" Add Moving Avg: ", inputId="ma", c("30 Day" = "30", "20 Day" = "20")),
              submitButton("Get Chart")
              ),
        
            mainPanel(
              #h3('Chart Area'),
              #verbatimTextOutput("symbol"),
              plotOutput("chart")
            )
))