#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)

# Define UI for application that draws a histogram
ui <- page_sidebar(
  title = 'censusVis',
  sidebar = sidebar(
    helpText(
      'Create demographic maps with information from the 2010 US Census'
    ),
    selectInput(
      'var',
      label = 'Choose a variable to display',
      choices = list('Percent White' = 1, 'Percent Black' = 2, 'Percent Hispanic' = 3, 'Percent Asian' = 4),
      selected = 1
    ),
    
    sliderInput(
      'range',
      label = 'Range of interest:',
      min = 0,
      max = 100,
      value = c(0, 100)
    )
  ),
  textOutput('selected_var'),
  testOutput('min_max')
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$selected_var <- renderText({
    paste('You have selected', input$var)
  })
  
  output$min_max <- renderText({
    paste('You have chosen a range that goes from',
          input$range[1], 'to', input$range[2])
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

