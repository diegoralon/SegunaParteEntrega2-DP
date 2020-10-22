
library(shiny)
library(ggplot2)
library(dplyr)


shinyServer(function(input, output, session){
 
output$cdc <- renderPlot({
        dt %>% 
            select(Class) %>% 
            group_by(Class) %>% 
            summarise(champs = n()) %>% 
            ggplot(aes(x=Class, y=champs)) +
            geom_bar(stat="identity", fill="sienna2")+
            geom_text(aes(label=champs), vjust=-0.3, size=3.5)+
            theme_minimal()
        
        
    })

output$cyd <- renderPlot({
    dt %>% 
        group_by(Difficulty) %>% 
        summarise(NumeroChamps = n_distinct(Name)) %>% 
        ggplot(aes(x=Difficulty, y=NumeroChamps)) +
        geom_bar(stat="identity", fill="steelblue")+
        geom_text(aes(label=NumeroChamps), vjust=-0.3, size=3.5)+
        theme_minimal()
    
})
    
output$ccdh <- renderPlot({
        dt %>% 
            select(Name,Style) %>% 
        filter(Style > 9) %>% 
        ggplot(aes(x=Name, y=Style)) +
        geom_bar(stat="identity", fill="deeppink1")+
        geom_text(aes(label=Style), vjust=-0.3, size=3.5)+
        theme(axis.text.x=element_text(angle=90, hjust=1))
        
    })

output$cdb <- renderPlot({
    dt %>% 
        select(Name,Style) %>% 
        filter(Style < 2) %>% 
        ggplot(aes(x=Name, y=Style)) +
        geom_bar(stat="identity", fill="lightblue1")+
        geom_text(aes(label=Style), vjust=-0.3, size=3.5)+
        theme(axis.text.x=element_text(angle=90, hjust=1))
    
})

output$cmcc <- renderPlot({
    dt %>% 
        select(Name,Crowd.Control) %>% 
        filter(Crowd.Control > 2) %>% 
        ggplot(aes(x=Name, y=Crowd.Control)) +
        geom_bar(stat="identity", fill="tomato1")+
        geom_text(aes(label=Crowd.Control), vjust=-0.3, size=3.5)+
        theme(axis.text.x=element_text(angle=90, hjust=1))
    
})





output$Seleccion_clase <- renderPrint({
    dt %>% 
        select(Name,Class) %>% 
        filter(input$select_input == Class)
    
    
})

output$Seleccion_td <- renderPrint({
  dt %>% 
    select(Name,DamageType) %>% 
    filter(input$select_input2 == DamageType)
  
  
})

output$campeones_dificil <- renderPrint({
  dt %>% 
    select(Name,Difficulty) %>% 
    filter(input$numeric_input == Difficulty)
  
  
})

output$Campeones_crowdcontrol <- renderPrint({
  dt %>% 
    select(Name,Crowd.Control) %>% 
    filter(input$numeric_input2 == Crowd.Control)
  
  
})



output$explorar <- DT::renderDataTable({
  DT::datatable(dt,
                extensions = 'Buttons',
                options = list(pageLength = 5,
                               lengthMenu = c(5, 10, 15),
                               dom = 'Bfrtip',
                               buttons = c('csv')),
                filter = 'bottom'
                
  ) 
})

output$ctam <- renderPrint({
  dt %>% 
    select(Name,Sturdiness) %>% 
    filter(input$numeric_input3 == Sturdiness)
  
  
})

output$caf <- renderPrint({
  dt %>% 
    select(Name,Functionality) %>% 
    filter(input$numeric_input4 == Functionality)
  
  
})

output$cav <- renderPrint({
  dt %>% 
    select(Name,Mobility) %>% 
    filter(input$numeric_input5 == Mobility)
  
  
})

})

