###################################################
##########           Libraries     ################
###################################################


library(shiny)
library(shinydashboard)
library(ggplot2)
library(readr) # CSV file I/O, e.g. the read_csv function
library(caret)
library(randomForest)
library(caTools)   #<- For stratified split
library(rpart.plot)
###################################################
##########           Sources       ################
###################################################

source("data.r")
source("main.r")

###################################################
##########           UI            ################
###################################################




##########           SIDEBAR       ################
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Main", tabName = "main", icon = icon("user"))
    
    )
)


##########          BODY           ################


body <- dashboardBody(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  
  
  tabItems(
    
    main
    
  )
)

##########           UI       ################

ui <- dashboardPage(skin = "green",
                    
                    dashboardHeader(title = "Cognitive Systems"),
                    sidebar,
                    body
                    
)