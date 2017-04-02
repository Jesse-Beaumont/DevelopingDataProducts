#
#  Shiny application renders a choropleth of US States
#  allowing comparison of ER visits, Readmits, and Ambulance Use.
#
library(shiny)
library(plotly)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {


   # ---------------------------------------
   #   Emergency Room Visits (per 1000)
   # ---------------------------------------
   output$erPlot <- renderPlotly({

     filtered_results <- subset(df_states, ER_VISITS_PER_K >= input$er_visits)

     pop = filtered_results$ER_VISITS_PER_K
     state_codes = filtered_results$STATE

     e <- plot_ly(filtered_results, z=pop, locations=state_codes,
             type="choropleth",
             locationmode="USA-states",
             colors = 'Blues',
             filename="stackoverflow/simple-choropleth") %>%
          layout(geo = list(scope="usa"))
     e

   })
   # ---------------------------------------
   #   Readmittance Rate
   # ---------------------------------------
   output$readmitPlot <- renderPlotly({

      filtered_results <- subset(df_states, READMIT_RATE >= input$readmit_rate)

      pop = filtered_results$READMIT_RATE
      state_codes = filtered_results$STATE

      r <- plot_ly(filtered_results, z=pop, locations=state_codes,
                   type="choropleth",
                   locationmode="USA-states",
                   colors = 'Oranges',
                   filename="stackoverflow/simple-choropleth") %>%
         layout(geo = list(scope="usa"))
      r

   })
   # ---------------------------------------
   #   Ambulance Utilizaiton Rate
   # ---------------------------------------
   output$ambPlot <- renderPlotly({

      filtered_results <- subset(df_states, AMB_RATE >= input$amb_util_rate)

      pop = filtered_results$AMB_RATE
      state_codes = filtered_results$STATE

      a <- plot_ly(filtered_results, z=pop, locations=state_codes,
                   type="choropleth",
                   locationmode="USA-states",
                   colors = 'Greens',
                   filename="stackoverflow/simple-choropleth") %>%
         layout(geo = list(scope="usa"))
      a

   })

   # ---------------------------------------

})
