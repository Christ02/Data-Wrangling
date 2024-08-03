
moda <- function(v) {
  valores <- unique(v)
  valores[which.max(tabulate(match(v, valores)))]
}

my_list <- list(
  c(1, 2, 2, 3, 3, 3, 4, 4),
  c(10, 20, 20, 20, 30, 40),
  c(5, 5, 6, 7, 8, 8, 8)
)

modes <- lapply(my_list, moda)

print(modes)
