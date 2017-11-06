# Timings - growing a vector

# Growing a vector is one of the deadly sins in R; you should always avoid it.
# 
# The growing() function defined below generates n random standard normal numbers, but grows the size of the vector each time an element is added!
#   
#   Note: Standard normal numbers are numbers drawn from a normal distribution with mean 0 and standard deviation 1.

# 
# n <- 30000
# # Slow code
# growing <- function(n) {
#   x <- NULL
#   for(i in 1:n)
#     x <- c(x, rnorm(1))
#   x
# }


system.time()



n <- 30000
# Slow code
growing <- function(n) {
  x <- NULL
  for(i in 1:n)
    x <- c(x, rnorm(1))
  x
}

system.time(growing(n))

pre_allocate <- function(n){
  
  x <- numeric(n) # Pre-allocate
  for(i in 1:n)
    x[i] <- rnorm(1)
  x
}

system.time(pre_allocate(n))







