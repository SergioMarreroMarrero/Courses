
install.packages("parallel")
# Load the parallel package
library(parallel)
library(tidyverse)
# Store the number of cores in the object no_of_cores
no_of_cores <- detectCores()

# Print no_of_cores
print(no_of_cores)



m <- matrix(rnorm(1000), ncol = 10)
res <- apply(m ,3, median)




# Determine the number of available cores
detectCores()

# Create a cluster via makeCluster
cl <- makeCluster(2)

# Parallelize this code
parApply(cl,m, 2, median)

# Stop the cluster
stopCluster(cl)


# SAPPLY
for(i in 1:10) 
    x[i] <- simulate(i)

# Can be writen as

sapply(1:10, simulate)



# Bootstrapping
# In a perfect world, we would resample from the population, but actually we can't. 
# Instead, we assume the original sample is representatibe of the population
# 1. Sample with replacement from your data: The same point could appear multiple times
# 2. Calculate the correlation statistics from your new sample
# 3. Repeat

# Function bootstrap
bootstrap <- function(data_set){
    ## Sample with replacement
    s <- sample(1:nrow(data_set), replace = TRUE)
    new_data <- data_set[s, ]
    
    # Colnames
    colnames(new_data) <- c("Attack", "Defense")
    
    ## Calculate the correlation
    cor(new_data$Attack, new_data$Defense)
}

## 100 independet bootstrap simulation

EPL <- as_tibble(readRDS("../Data/EPL10.RDS"))

data_set <- EPL[, 1:2]
bootstrap(data_set)

# Make parallel
no_of_cores <- 3
# Create a cluster object
cl <- makeCluster(no_of_cores)
# Export functions/data
clusterExport(cl, c("bootstrap","data_set"))

# Swap to parApply()
parSapply(cl, 1:100, function(i) bootstrap(data_set))

stopCluster(cl)



