#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Define UI for application that draws a histogram
ui <- dashboardPage(
  dashboardHeader(
    title = "Opioid Prescriptions"),
  dashboardSidebar(
    title = tags$blockquote("View the number of scripts written in 2014 by selecting their home states and their genders below:"),
    selectInput("select", 
                label = h3("State"), 
                choices = states, 
                selected = "TX"),
    br(),
    checkboxGroupInput("checkGroup", 
                       label = h3("Gender of Prescribers"), 
                       choices = gender,
                       selected = "M"),
    br(),
    actionButton("go", "Go")),
  
  dashboardBody(
    
    plotOutput("plot")
  )
)