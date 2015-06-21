library(ggplot2)
library(HistData)

childHeight <- function(parentHeight) parentHeight*0.66+23
g <- ggplot(Galton, aes(x=parent,y=child)) + geom_point(size=3)

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$parentHeight})
    output$prediction <- renderPrint({childHeight(input$parentHeight)})
    output$plot <- renderPlot({print(g + geom_point(aes_string(x=input$parentHeight,y=childHeight(input$parentHeight)), color="red", size=5)) 
                                                                
                                           
                               })
  }
)

