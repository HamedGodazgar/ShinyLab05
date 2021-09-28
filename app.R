
library(shiny)
library(PackG13Lab05)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("2014 Election Winner's Result"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 20,
                  value = 10)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

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

# Create Shiny app ----
shinyApp(ui = ui, server = server)