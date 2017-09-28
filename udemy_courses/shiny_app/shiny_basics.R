## A basic shiny app
library(shiny)

## FIRST TRY ##
server <- function(input, output, session){}

ui <- basicPage("Our first basic app") # the user interface

shinyApp(ui = ui, server = server) # perform app launch



###############################################################



## Using textInput and checkboxInput
server <- function(input, output, session){}

ui <- basicPage(
  
  h1("Using textInput and checkboxInput"),
  textInput("mystring","Write here"),
  checkboxInput("mycheckbox", "Factor Y")
)
shinyApp(ui = ui, server = server)



###############################################################
## Making the app reactive

server <- function(input, output, session){

  observe({
    
    addtext <- paste("your initial input:", input$mystring)
    updateTextInput(session, "mystring2", value = addtext)
    
    
  })
  
}

ui <- basicPage(
  
  
  h1("Using Observe"),
  textInput("mystring", "Write here"),
  textInput("mystring2", "Full App Output")
  
)
  
shinyApp(ui = ui, server = server)







## Using reactive and render in one app

## using reactive and render in one app

server <- function(input, output, session) {
  
  data <- reactive({
    rnorm(50) * input$myslider
  })
  
  output$plot <- renderPlot({
    plot(data(), col = "red", pch = 21, bty = "n")
  })
}

ui <- basicPage(
  h1("Using Reactive"),
  sliderInput(inputId = "myslider",
              label = "Slider1",
              value = 1, min = 1, max = 20),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)



####
## layouting - basic sidebar layout

server <- function(input, output, session) {}

ui <- fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      "my sidebar"
    ), 
    
    mainPanel(
      "my mainpanel"
    )
  )
)

shinyApp(ui = ui, server = server)



###############################################################


## layouting - tabsets

server <- function(input, output, session) {}

ui <- fluidPage(
  
  titlePanel("using Tabsets"), # our title
  
  sidebarLayout(
    
    sidebarPanel(
      sliderInput(inputId = "s1",
                  label = "My Slider",
                  value = 1, min = 1, max = 20)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Tab1", "First Tab"), 
        tabPanel("Tab2", "Second Tab"), 
        tabPanel("Tab3", "Third Tab")
      )
    )
  )
)

shinyApp(ui = ui, server = server)





## Tags

server <- function(input, output, session) {}

ui <- fluidPage(
  
  titlePanel(strong("This is the STRONG tag on the Title")), # using strong as a direct tag
  
  sidebarLayout(
    
    sidebarPanel(
      withTags(
        div(
          b("bold text: here you see a line break, a horizontal line and some code"),
          br(),
          hr(),
          code("plot(lynx)")
        ))),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Weblinks with direct tag a", a(href="www.r-tutorials.com", "r-tutorials")), 
        tabPanel(tags$b("Using b for bold text"), tags$b("a bold text")), 
        tabPanel("Citations with the blockquote tag", tags$blockquote("R is Great", cite = "R Programmer"))
      )
    )
  ))

shinyApp(ui = ui, server = server)






## changing the themes

server <- function(input, output, session) {}

library(shinythemes) # adding the shinythemese package

ui <- fluidPage(theme = shinytheme("darkly"), #themeSelector("yeti"), # displaying the different themes, replace this line when publishing with theme = shinytheme("darkly")
                
                titlePanel(strong("This is the STRONG tag on the Title")), # using strong as a direct tag
                
                sidebarLayout(
                  
                  sidebarPanel(
                    withTags(
                      div(
                        b("bold text: here you see a line break, a horizontal line and some code"),
                        br(),
                        hr(),
                        code("plot(lynx)")
                      ))),
                  
                  mainPanel(
                    tabsetPanel(
                      tabPanel("Weblinks with direct tag a", a(href="www.r-tutorials.com", "r-tutorials")), 
                      tabPanel(tags$b("Using b for bold text"), tags$b("a bold text")), 
                      tabPanel("Citations with the blockquote tag", tags$blockquote("R is Great", cite = "R Programmer"))
                    )
                  )
                ))

shinyApp(ui = ui, server = server)





































