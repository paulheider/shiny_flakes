library(shiny)    

shinyUI( fluidPage(    
  
  title = "Brrrrr!" ,
  
  sliderInput("flakes" , 
              "Snowflakes" , 
              min = 1 ,
              max = 500 , 
              value = 100 ) ,

  plotOutput("distPlot")
  )
)