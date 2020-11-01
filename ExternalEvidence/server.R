server <- function(input, output, session) {
    output$greeting <- renderText("Hello human!")
}

