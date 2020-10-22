
library(shiny)
library(readxl)
library(DT)
dt <- read.csv("LoL-Champions.csv")


shinyUI(fluidPage(
    
    titlePanel("League Of Legends Champions"),
   
    tabsetPanel(
      tabPanel("Análsis Campeones",
                         h1("Clases De Campeones"),
                         plotOutput("cdc"),
                         h1("Campeones y su dificultad "),
                         plotOutput("cyd"),
                         h1("Campones que dependen de sus habilidades"),
                         plotOutput("ccdh"),
                         h1("Campeones que dependen de sus Básicos"),
                         plotOutput("cdb"),
                         h1("Campeones con Mejor CrowdControl"),
                         plotOutput("cmcc")
                         
                         ),


tabPanel("Conozca League Of Legends", 
                     
                     sidebarLayout(
                         sidebarPanel(
                             selectInput('select_input',"Seleccione una Clase:",
                                         choices = c(dt$Class),
                                         selected ="Warrior",
                                         multiple = FALSE ),
                             selectInput('select_input2',"Seleccione el tipo de daño:",
                                         choices = c(dt$DamageType),
                                         selected = "P",
                                         multiple = FALSE),
                             numericInput("numeric_input", "Ingrese nivel de dificultad: ",
                                          value = 1,min = 1, max = 3,step = 1 ),
                             numericInput("numeric_input2", "Te gusta controlar la partida? Ingrese de 1 a 3",
                                          value = 1, min = 1,max = 3,step = 1)
                             
                             
),

mainPanel(
    h2("Campeones y su estilo"),
    verbatimTextOutput("Seleccion_clase"),
    h2("Campeones con su tipo de daño (Physical,Magic,Mixed)"),
    verbatimTextOutput("Seleccion_td"),
    h2("Campeones con el nivel de dificultad seleccionado (1=Facil,2=Intermedio,3=Difícil)"),
    verbatimTextOutput("campeones_dificil"),
    h2("Campeones que te haran controlar la partida (1= Poco Control 2=Intermedio 3=Máximo Control)"),
    verbatimTextOutput("Campeones_crowdcontrol")
    
    
    

)


)),

tabPanel("Explora por tu cuenta a League of Legends",
         fluidRow(column(6,
                         h2("Conoce a tus campeones Favoritos"),
                         DT::dataTableOutput("explorar"),
                         verbatimTextOutput("cmfav")))),

         
         


tabPanel("Factores de MacroPlay de los Campeones",
         numericInput("numeric_input3","Ingrese de 1-3 que tanto le gusta sentirse invencible",
                      value = 0, max = 3,min = 0,step = 1),
         numericInput("numeric_input4","Ingrese de 1-3 que tanto le gusta aportar a tu equipo",
                      value = 0, max = 3,min = 0,step = 1),
         numericInput("numeric_input5","Ingrese de 1-3 que tanto le gusta sentir velocidad en el juego",
                      value = 0, max = 3,min = 0,step = 1),

mainPanel(
  h2("Campeones que te ayudaran a tu equipo a soportar más daño"),
  verbatimTextOutput("ctam"),
  h2("Campeones que aportan funcionalidad a la partida"),
  verbatimTextOutput("caf"),
  h2("Campeones más rápidos y con mayor movilidad"),
  verbatimTextOutput("cav")
  
  
)
)

)
                  
                  
                  
                  ))
         
         
         
         
         
         










 


