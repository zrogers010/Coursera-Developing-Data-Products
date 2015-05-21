library(shiny)
library(quantmod)
library(zoo)

getQuotes <- function(sym, start, end) {
  #symbol <- "CSCO"
  symbol <- toupper(sym)
  startDate <- start
  endDate <- end
  data <- getSymbols(symbol, src="yahoo",from=startDate, to=end, auto.assign=FALSE)
  #adjustedClose <- paste(symbol, ".Adjusted", sep="")
  #data <- data[, adjustedClose, drop=FALSE]
  #zoo.data <- zoo(data)
  #ma <- rollmean(zoo.data, 30)
  #print(data)
}

plotQuotes <- function(symbol, startDate, endDate, ma=30) {
  quotes <- getQuotes(symbol, startDate, endDate)
  #quotes
  #zoo.data <- zoo(quotes)
  #ma <- rollmean(zoo.data, 30)
  #ma
  #plot(quotes, type = "l", main=symbol, ylab="Price ($)", xlab="Date")
  candleChart(quotes, name=toupper(symbol), theme="white", type="candles", TA="addBBands()")
  #grid()
  #lines(quotes, ma, col="red")
  #addSMA(n=30, col="red")
  addSMA(n = 5, on = 1, with.col = Cl, overlay = TRUE, col = "red")
}

ma30 <- function() {
  addSMA(n = 30, on = 1, with.col = Cl, overlay = TRUE, col = "red")
}
# Shiny Server
shinyServer(
  function(input, output) {
    output$symbol <- renderPrint({toupper(input$symbol)})
    output$chart <- renderPlot({plotQuotes(input$symbol, input$startDate, input$endDate)})
    #output$chart <- renderPlot({ma30})
  }
  )

