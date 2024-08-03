library(readxl)
library(dplyr)
library(lubridate)

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


find_mode <- function(v) {
  uniq_vals <- unique(v)
  uniq_vals[which.max(tabulate(match(v, uniq_vals)))]
}

my_list <- list(
  c(1, 2, 2, 3, 3, 3, 4, 4),
  c(10, 20, 20, 20, 30, 40),
  c(5, 5, 6, 7, 8, 8, 8)
)

modes <- lapply(my_list, find_mode)

# Ver el resultado
print(modes)
