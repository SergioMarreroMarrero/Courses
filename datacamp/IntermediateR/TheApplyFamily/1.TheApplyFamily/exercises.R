library(tidyverse)
library(readxl)
# R version
nyc <- list(pop = 8405837,
            boroughs = c("Manhattan", "Bronx", "Brooklyn",
                         "Queens", "State Island"),
            capital = FALSE)

for(info in nyc){
    print(class(info))
}


lapply(nyc, class)


cities <- c("Barcelona", "Madrid", "Las Palmas")

num_chars <- c()
for(i in 1:length(cities)) num_chars[i] <- nchar(cities[i])
num_chars

lapply(cities, nchar)
oil_prices <- list(2.56, 3.56, 3.6, 3.23, 432.4, 124)
triple <- function(x){
    3 * x
}

result <- lapply(oil_prices, triple)


multiply <- function(x, factor){
    factor * unlist(x)
}


times_l <- lapply(1:10, function(i) multiply(oil_prices, 3))





