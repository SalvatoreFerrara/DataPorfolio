
library(hash)
library(tidyverse)
library(plotrix)
library(shiny)
library("readxl")


data <- read_excel("2020_INDAGINE_MASTER_2015_2019.xlsx")

filter <- function(master, nationality) {
  diz <- hash()
  m<-select(data, 2)
  n<-select(data, 4)
  d<-select(data, 3)
  
  for (i in 1:dim(m)[1]){
    curMaster = toString(m[i,1])
    curNation = toString(n[i,1])
    if(master == "ALL" && nationality == curNation){
      curYear = toString(d[i,1])
      if(curYear != "In which year did you complete your Master?" && curYear != "NA"){
        if(is.null(diz[[curYear]])){
          diz[[curYear]] <- 1
        }else{
          value = diz[[curYear]]
          diz[[curYear]] = value+1
        }
      }
    }
    if(master == curMaster && nationality == "ALL"){
      curYear = toString(d[i,1])
      if(curYear != "In which year did you complete your Master?" && curYear != "NA"){
        if(is.null(diz[[curYear]])){
          diz[[curYear]] <- 1
        }else{
          value = diz[[curYear]]
          diz[[curYear]] = value+1
        }
      }
    } 
    
    if(master == "ALL" && nationality == "ALL"){
      curYear = toString(d[i,1])
      if(curYear != "In which year did you complete your Master?" && curYear != "NA"){
        if(is.null(diz[[curYear]])){
          diz[[curYear]] <- 1
        }else{
          value = diz[[curYear]]
          diz[[curYear]] = value+1
        }
      }
    } 
    if(master == curMaster && nationality == curNation){
      curYear = toString(d[i,1])
      if(curYear != "In which year did you complete your Master?" && curYear != "NA"){
        if(is.null(diz[[curYear]])){
          diz[[curYear]] <- 1
        }else{
          value = diz[[curYear]]
          diz[[curYear]] = value+1
        }
      }
    }
  }
  
  if(length(keys(diz))>0){
    frame <- data.frame(keys(diz),values(diz))
    colnames(frame)[1] <- "Year"
    colnames(frame)[2] <- "Alumni"
    return(frame)
  }else{
    frame <- data.frame(c(0),c(0))
    colnames(frame)[1] <- "Year"
    colnames(frame)[2] <- "Alumni"
    return(frame)
  }
  
}


column<-select(data, 4)

diz <- hash()
for (i in 1:dim(column)[1]){
  current = toString(column[i,1])
  #print(column[i,1])
  if(is.null(diz[[current]])){
    diz[[current]] <- 1
  }else{
    value = diz[[current]]
    diz[[current]] = value+1
  }
}



 ui <- fluidPage(
   titlePanel("Masters Completed"),
   sidebarLayout(
     sidebarPanel(
       selectInput('master', 'Select Master', c("ALL","MARC","MCC","MCMH","MEP","MEPIN","MFC","MFIN","MINF","MKTG","MLLCI","MMG","MMM","MPHC","MT","PMP","OTHER")),
       selectInput('nationality', 'Select Nationality', c("ALL","Italian","Other","Swiss - Ticino","Swiss - Other Swiss Canton"))
     ),
     mainPanel(
       plotOutput('plot')
      )
    )
  )


 server <- function(input, output, session) {
   output$plot <- renderPlot({
     d <- filter(input$master, input$nationality)
     ggplot(d, aes(x = Year , y = Alumni)) +
       geom_col() + 
       geom_bar(stat= "identity", fill = "steelblue") + 
       geom_text(aes(label = Alumni), vjust = 1.6, size = 3.5, color = "white") +
       theme_minimal() 
   })


 }
 shinyApp(ui = ui, server = server)
