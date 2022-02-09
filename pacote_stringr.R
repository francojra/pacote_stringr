
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