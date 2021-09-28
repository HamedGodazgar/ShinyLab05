

library(shiny)
library(PackG13Lab05)
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    #df <- readxl::read_excel('C:\\Users\\a\\Downloads\\2014_riksdagsval_per_kommun (1).xls')
    url <- 'https://data.val.se/val/val2014/statistik/2014_riksdagsval_per_kommun.xls'
    df <- PackG13Lab05::read_data(url)
    x    <- as.numeric(df[[1]]$`S proc`)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Vote Percentage's Range", ylab = 'Number of KOMMUNs',
         main = "Vote Percentage of 'Social Democratic Party'")
    
  })
  
}