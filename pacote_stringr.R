
# Pacote stringr ---------------------------------------------------------------------------------------------------------------------------

# Referência: Curso R ----------------------------------------------------------------------------------------------------------------------

# Data: 06/02/22 ---------------------------------------------------------------------------------------------------------------------------

# Carregar o pacote stringr ----------------------------------------------------------------------------------------------------------------

install.packages("stringr")
library(stringr)

# Funções básicas --------------------------------------------------------------------------------------------------------------------------

str_length("São Paulo")
## [1] 9

str_length(c("São Paulo", "Rio de Janeiro", 
             "Rio Grande do Norte", "Acre"))
## [1]  9 14 19  4

s <- c("São Paulo", "Rio de Janeiro", 
       "Rio Grande do Norte", "Acre")

str_length(s)
## [1]  9 14 19  4

length(s)
## [1] 4

s <- "Somos a curso-r"

str_to_lower(s)
## [1] "somos a curso-r"

str_to_upper(s)
## [1] "SOMOS A CURSO-R"

str_to_title(s)
## [1] "Somos A Curso-R"

s <- "Somos a curso-r"

str_to_lower(s)
## [1] "somos a curso-r"

str_to_upper(s)
## [1] "SOMOS A CURSO-R"

str_to_title(s)
## [1] "Somos A Curso-R"

s <- c("M", "F", "F", " M", " F ", "M")

as.factor(s)
## [1] M   F   F    M   F  M  
## Levels:  F   M F Ms <- c("M", "F", "F", " M", " F ", "M")

# A função str_trim() ajuda removendo os espaços excedentes antes e depois da string.

string_aparada <- str_trim(s)

as.factor(string_aparada)
## [1] M F F M F M
## Levels: F M

s <- c("01-Feminino", "02-Masculino", "03-Indefinido")

# Você pode querer apenas a parte final da string. Neste caso, pode usar a função str_sub().

# pegar do quarto até o último caractere, o primeiro caractere é o 0
str_sub(s, start = 4) 
## [1] "Feminino"   "Masculino"  "Indefinido"

# Também é possível obter apenas os números.

str_sub(s, end = 2) 
## [1] "01" "02" "03"

# Em outros casos você precisa obter os últimos 2 caracteres.

s <- c("Feminino-01", "Masculino-02", "Indefinido-03")

str_sub(s, end = -4)
## [1] "Feminino"   "Masculino"  "Indefinido"

str_sub(s, start = -2)
## [1] "01" "02" "03"

# É possível usar os argumentos start e end conjuntamente.

s <- c("__SP__", "__MG__", "__RJ__")

str_sub(s, 3, 4)
## [1] "SP" "MG" "RJ"

# str_c
# Análoga à função paste0() do R base, concatena strings em uma única string.

string1 <- "O valor p é: "
string2 <- 0.03

str_c(string1, string2) 
## [1] "O valor p é: 0.03"

# Pode misturar objetos com strings definidas diretamente na função.

string1 <- "Brigadeiro"
string2 <- "bom"
string3 <- "melhor"

str_c(string1, " é a prova de que não existe nada tão ", string2,
      " que não pode ficar ", string3, ".")
## [1] "Brigadeiro é a prova de que não existe nada tão bom que não pode ficar melhor."

# A função é vetorizada.

string1 <- c("Brigadeiro", "A política brasileira")
string2 <- c("bom", "ruim")
string3 <- c("melhor", "pior")

str_c(string1, " é a prova de que não existe nada tão ", string2,
      " que não pode ficar ", string3, ".")
## [1] "Brigadeiro é a prova de que não existe nada tão bom que não pode ficar melhor."          
## [2] "A política brasileira é a prova de que não existe nada tão ruim que não pode ficar pior."

# Expressões Regulares

# Trabalhar com textos exige um certo conhecimento de expressões regulares. As expressões regulares —
# ou simplesmente regex — permitem identificar conjuntos de caracteres, palavras e outros padrões 
# por meio de uma sintaxe concisa.

# amos estudar expressões regulares por meio de exemplos e da função str_detect(). 
# Ela retorna TRUE se uma string atende a uma expressão regular e FALSE caso contrário. Por exemplo:

str_detect("sao paulo", pattern = "paulo$")
## [1] TRUE
str_detect("sao paulo sp", pattern = "paulo$")
## [1] FALSE

# A regex/pattern “paulo$” indica que o texto deve ser terminado em “paulo”. 

# Funções que utilizam regex ---------------------------------------------------------------------------------------------------------------

## Agora que já vimos as funções básicas do stringr e aprendemos um pouco de regex, vamos às funções 
## mais avançadas. Basicamente, essas funções buscarão patterns em um vetor de strings e farão 
## alguma coisa quando encontrá-lo.

## str_detect(): Retorna TRUE se a regex é compatível com a string e FALSE caso contrário.

library(stringr)

str_detect("sao paulo", pattern = "paulo$")
## [1] TRUE

str_detect("sao paulo sp", pattern = "paulo$")
## [1] FALSE

## str_replace() e str_replace_all(): Substituem um padrão (ou todos) encontrado para um outro padrão.
## Substituindo apenas a primeira ocorrência.

cidades <- c("S. José do Rio Preto", "São Paulo", "S. José dos Campos", "São Roque", "S. S. da Grama")

str_replace(cidades, "S[.]", "São")
## [1] "São José do Rio Preto" "São Paulo"             "São José dos Campos"  
## [4] "São Roque"             "São S. da Grama"

## Veja que no exemplo anterior precisamos colocar o . entre colchetes. Se não tivéssemos colocado, 
## ele seria interpretado como uma regex e o padrão procurado seria “S” seguido de qualquer caracter:

cidades <- c("S. José do Rio Preto", "São Paulo", "S. José dos Campos", "São Roque", "S. S. da Grama")

str_replace(cidades, "S.", "São")
## [1] "São José do Rio Preto" "Sãoo Paulo"            "São José dos Campos"  
## [4] "Sãoo Roque"            "São S. da Grama"

## Nesses casos, podemos usar a função fixed() para indicar que o padrão procurado não é uma regex:

cidades <- c("S. José do Rio Preto", "São Paulo", "S. José dos Campos", "São Roque", "S. S. da Grama")

str_replace(cidades, fixed("S."), "São")
## [1] "São José do Rio Preto" "São Paulo"             "São José dos Campos"  
## [4] "São Roque"             "São S. da Grama"

## No exemplo abaixo, substituímos todas as ocorrências de . e - por um espaço.

cpf <- c("303.030.111-33", "102-177-011-20", "987.220.199.00")

str_replace_all(cpf, "[.-]", " ")
## [1] "303 030 111 33" "102 177 011 20" "987 220 199 00"

