# The user-interface definition of the Shiny web app.
library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(dplyr)
library(DT)

shinyUI(
    navbarPage("LEGO Set Visualizer", 
    # multi-page user-interface that includes a navigation bar.
        tabPanel("Explore the Data",
             sidebarPanel(
                sliderInput("timeline", 
                            "Timeline:", 
                            min = 1950,
                            max = 2016,
                            value = c(1996, 2014)),
                sliderInput("pieces", 
                            "Number of Pieces:",
                            min = -1,
                            max = 5922,
                            value = c(271, 2448) 
                ),
                            #format = "####"),
                uiOutput("themesControl"), # the id
                actionButton(inputId = "clearAll", 
                             label = "Clear selection", 
                             icon = icon("square-o")),
                actionButton(inputId = "selectAll", 
                             label = "Select all", 
                             icon = icon("check-square-o"))
        
             ),
             mainPanel(
                 tabsetPanel(
                   # Data 
                   tabPanel(p(icon("table"), "Dataset"),
                            dataTableOutput(outputId="dTable")
                   ), # end of "Dataset" tab panel
                   tabPanel(p(icon("line-chart"), "Visualize the Data"),
                            h4('Number of Sets by Year', align = "center"),
                            h5('Please hover over each point to see the Year and Total Number of Sets.', 
                               align ="center"),
                            showOutput("setsByYear", "nvd3"),
                            h4('Number of Themes by Year', align = "center"),
                            h5('Please hover over each bar to see the Year and Total Number of Themes.', 
                               align ="center"),
                            showOutput("themesByYear", "nvd3"),
                            h4('Number of Pieces by Year', align = "center"),
                            h5('Please hover over each point to see the Set Name, ID and Theme.', 
                               align ="center"),
                            showOutput("piecesByYear", "nvd3"),
                            h4('Number of Average Pieces by Year', align = "center"),
                            showOutput("piecesByYearAvg", "nvd3"),
                            h4('Number of Average Pieces by Theme', align = "center"),
                            showOutput("piecesByThemeAvg", "nvd3")
                   ) # end of "Visualize the Data" tab panel

                 )
                   
            )     
        ) # end of "Explore Dataset" tab panel
    )  
)
