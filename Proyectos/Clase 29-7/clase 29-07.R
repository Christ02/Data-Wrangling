library(readr)
library(readxl)
library(openxlsx)

leerExcel <- read_excel("Clase 29-7/data/example_1.xlsx")
head(leerExcel)

leer_csv <- read_csv("Clase 29-7/data/example_2.csv")
head(leer_csv)

leer_txt <- read_delim("Clase 29-7/data/example_3.txt", delim = ';')
head(leer_txt)

leer_txt <- read_delim("Clase 29-7/data/example_4.txt", delim = '|')
head(leer_txt)

write.xlsx(leer_txt, 'excel_exposrtado.xlsx')
?write.xlsx
