
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