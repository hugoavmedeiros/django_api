pacman::p_load(
  #etl
  tidyverse,
  # api
  httr, jsonlite)

# URL da API de exemplo
url <- "http://127.0.0.1:8000/api/v1/fundos"

# Credenciais de autenticação
login <- "admin"
senha <- "admin"

# Criando um token de autenticação
token <- httr::authenticate(login, senha)

#### solicitação ----
#solicitação 
resposta <- httr::GET(url, authenticate(login, senha))

# conteúdo
conteudo <- httr::content(resposta, "text")

# dados
dados <- jsonlite::fromJSON(conteudo)

dados %>% View()
