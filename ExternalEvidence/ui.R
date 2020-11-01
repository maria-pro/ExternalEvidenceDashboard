library(shiny)

ui <- fluidPage(
    textOutput("greeting")
)
shinyApp(ui, server)