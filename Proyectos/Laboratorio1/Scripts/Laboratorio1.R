library(readxl)
library(dplyr)
library(lubridate)
library(openxlsx)
library(readr)

process_file <- function(file_path, base_date, months_to_add) {
  data <- read_excel(file_path)
  date_value <- base_date %m+% months(months_to_add - 1)
  data <- data %>% 
    mutate(FECHA = as.Date(date_value)) %>%
    select(COD_VIAJE, CLIENTE, UBICACION, CANTIDAD, PILOTO, Q, CREDITO, UNIDAD, FECHA)
  return(data)
}

base_date <- as.Date("2023-01-01")
file_paths <- sprintf("Laboratorio1/%02d-2023.xlsx", 1:11)

data_list <- lapply(seq_along(file_paths), function(i) {
  process_file(file_paths[i], base_date, i)
})

combined_data <- bind_rows(data_list)
write.xlsx(combined_data, 'excel_laboratorio1.xlsx')

library(knitr)

# Usamos knitr para convertir el dataframe a formato Markdown
markdown_table <- kable(combined_data, format = 'markdown')

# Escribe la tabla en un archivo de texto
writeLines(markdown_table, 'output_table.md')
