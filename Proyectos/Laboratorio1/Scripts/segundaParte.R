
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
