url <- 'https://portal.sat.gob.gt/portal/descarga/4801/analisis-estadistico-del-parque-vehicular/36825/informacion_para_analisis_estadistico_vehiculos_2019_enero.zip'
download.file(url, destfile = 'vehiculos_2019_enero.zip')

unzip('vehiculos_2019_enero.zip', exdir = 'vehiculos_2019_enero')

library(readr)

files <- list.files('vehiculos_2019_enero', pattern = '\\.txt$', full.names = TRUE)

leer_txt <- read_delim(files[1], delim = '|')

head(leer_txt)
