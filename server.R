library(shiny)
library( tidyr )
library( dplyr )
library( ggplot2 )

shinyServer(function( input , output , session ) {
  
  autoInvalidate <- reactiveTimer( 100 , 
                                   session )
  
  output$distPlot <- renderPlot({
    autoInvalidate()
    # generate an rnorm distribution and plot it
    n <- input$flakes
    
    tibble( x = runif( n ) ,
            y = runif( n ) ,
            size = runif( n , min = 4 , max = 20 ) ) %>%
      ggplot( aes( x , y , size = size ) ) +
      geom_point( color = "white" , pch = 42 ) +
      scale_size_identity() +
      coord_cartesian( c( 0 , 1 ) , c( 0 , 1 ) ) +
      theme_void() +
      theme( panel.background = element_rect( fill = "black" ) ,
             plot.background = element_rect( fill = "black" ) )
  })
  
})
