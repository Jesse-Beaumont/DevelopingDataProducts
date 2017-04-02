#
#  Shiny application renders a choropleth of US States
#  allowing comparison of ER visits, Readmits, and Ambulance Use.
#
library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(
   fluidPage(

  # Application title
  titlePanel("2014 US Utilization of Emergency Rooms, Readmits, and Ambulances"),

  hr(),

  fluidRow(

     column(width=4,
         h4("Emergency department visits (per 1000 beneficiaries)"),
         plotlyOutput("erPlot")
     ),
     column(width=4,
         h4("% inpatient readmissions within 30 days of an acute hospital stay"),
         plotlyOutput("readmitPlot")
     ),
     column(width=4,
        h4("% beneficiaries using Ambulance services"),
        plotlyOutput("ambPlot")
     )

  ),

  fluidRow(
     column(width=4,
            sliderInput("er_visits", "Emergency Room Visits (per 1000):", min = min(df_states$ER_VISITS_PER_K),
                        max = max(df_states$ER_VISITS_PER_K),
                        value = min(df_states$ER_VISITS_PER_K), step = 100)
     ),
     column(width=4,
            sliderInput("readmit_rate", "Readmittance Rate:", min = min(df_states$READMIT_RATE),
                        max = max(df_states$READMIT_RATE),
                        value = min(df_states$READMIT_RATE), step = 0.01)
     ),
     column(width=4,
            sliderInput("amb_util_rate", "Ambulance Utilizaiton Rate:", min = min(df_states$AMB_RATE),
                        max = max(df_states$AMB_RATE),
                        value = min(df_states$AMB_RATE), step = 0.01)
     )
  ),

  hr(),

  h4("How to use this Application:"),

  p("   An individual US State map is displayed for ER Visits, Readmissions, and Ambulance uses. For each map, the state boundaries are shaded proportional to their individual measure. "),

  p("   Adjust the slider for each measure to change the lower threshold value displayed in the relative map.")

))



