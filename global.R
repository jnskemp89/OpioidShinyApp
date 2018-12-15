library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(reshape2)

opioid_final <- readRDS('opioid_final')
states <- sort(unique(opioid_final$State))
gender <- unique(opioid_final$Gender)
DrugNames <- names(opioid_final[6:16])
opioid_final <- melt(
  subset(opioid_final, select = -c(NPI, Credentials, Specialty, total_scripts, cumulative)),
  id.vars = c("Gender", "State"),
  variable.name = "Drug",
  value.name = "counts")
