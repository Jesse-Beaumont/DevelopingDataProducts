#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("US Utilization Rate ER, Readmits, and Ambulance"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
       sliderInput("er_visits", "Emergency Room Visits (per 1000):", min = min(df_states$ER_VISITS_PER_K),
                                                                     max = max(df_states$ER_VISITS_PER_K),
                                                                   value = min(df_states$ER_VISITS_PER_K), step = 100),

       sliderInput("readmit_rate", "Readmittance Rate:", min = min(df_states$READMIT_RATE),
                                                         max = max(df_states$READMIT_RATE),
                                                       value = min(df_states$READMIT_RATE), step = 0.01),

       sliderInput("amb_util_rate", "Ambulance Utilizaiton Rate:", min = min(df_states$AMB_RATE),
                                                                   max = max(df_states$AMB_RATE),
                                                                 value = min(df_states$AMB_RATE), step = 0.01)
    , width = 4),

    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput("erPlot"),
       plotlyOutput("readmitPlot"),
       plotlyOutput("ambPlot")
    )
  )
))
