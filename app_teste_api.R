library(shiny)
library(httr)
library(jsonlite)

login <- "admin"
senha <- "admin"

url <- "http://127.0.0.1:8000/api/v1/fundos"

token <- httr::authenticate(login, senha)

buscar_dados <- function() {

  resposta <- httr::GET(
    url, 
    authenticate(
      login, senha
      )
    )
  
  conteudo <- httr::content(
    resposta, 
    "text",
    encoding = 'UTF-8')
  
  dados <- jsonlite::fromJSON(conteudo)
  
  return(dados)
}


ui <- fluidPage(
  
  verbatimTextOutput("dados_output")
)

server <- function(input, output, session) {
  
  autoInvalidate <- reactiveTimer(5000)
  
  update_dados <- function() {
    dados <- buscar_dados()
    output$dados_output <- renderPrint({
      dados
    })
  }
  
  # Atualizar os dados inicialmente
  update_dados()
  
  # Atualizar os dados periodicamente
  observe({
    autoInvalidate()
    update_dados()
  })
}

shinyApp(ui = ui, server = server)
