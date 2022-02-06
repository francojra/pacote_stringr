# Pacote stringr

## Referência: [Curso R](https://livro.curso-r.com/7-4-o-pacote-stringr.html)

### Introdução

Variáveis de texto são muito comuns nos bancos de dados e, geralmente, dão bastante trabalho para serem manipuladas. É muito comum encontrarmos colunas com categorias não padronizadas, como, por exemplo, uma variável Estado com “SP”, “sp”, “Sao Paulo”, “São Paulo” etc, todas indicando o mesmo estado.

O R possui várias funções para manipular textos (ou strings). No entanto, as funções do base não possuem uma interface consistente e cada uma tem a sua forma de passar os parâmetros, dificultando a programação durante a análise.

Pensando nisso, Hadley Wickham deu aquela força para a comunidade R e criou o pacote stringr, que possui uma sintaxe consistente, permitindo o usuário manipular textos com muito mais facilidade.
