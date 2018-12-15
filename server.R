#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


# Define server logic required to draw bar plot
server <- function(input, output) {
  
  opioid_temp_reactive <- eventReactive(input$go, {
    opioid_final %>% 
      filter(Gender == input$checkGroup) %>% 
      filter(State == input$select) %>% 
      group_by(Drug) %>% 
      summarize(counts = sum(counts))
  })
  
  output$plot <- renderPlot({
    opioid_temp_reactive() %>% 
      ggplot(
        aes(x = Drug, y = counts, fill = 'orangered3')) +
      geom_col() +
      coord_flip() +
      labs(y = "Amount of Prescriptions") +
      theme(legend.position = 'none')
  })
}
