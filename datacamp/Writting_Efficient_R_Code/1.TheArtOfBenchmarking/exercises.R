library(tidyverse)
library(readxl)
# R version

# One of the relatively easy optimizations available is to use an up-to-date version of R. In general,
# R is very conservative, so upgrading doesn't break existing code. 
# However, a new version will often provide free speed boosts for key functions.
# 
# The version command returns a list that contains (among other things) the major and minor version of R currently being used.


# Print the R version details using version

version
# Assign the variable `major` to the major component
major <-  version$major

# Assign the variable `minor` to the minor component
minor <- version$minor


colon <- function(n) 1:n
colon(5)

seq_default <- function(n) seq(1,n)
seq_default(5)

seq_by <- function(n) seq(1, n, by = 1)
seq_by(5)


# Timing with system.time()
system.time(res <- colon(1e8))
system.time(res2 <- seq_default(1e8))
system.time(res3 <- seq_by(1e8))

library(microbenchmark)
install.packages("microbechmark")




# Comparing read times of CSV and RDS files

# One of the most common tasks we perform is reading in data from CSV files. However, 
# for large CSV files this can be slow. One neat trick is to read in the data and save as an R binary
# file (rds) using saveRDS(). To read in the rds file, we use readRDS().
# 
# Note: Since rds is R's native format for storing single objects, you have not introduced any 
# third-party dependencies that may change in the future.
# 
# To benchmark the two approaches, you can use system.time(). This function returns the time 
# taken to evaluate any R expression. For example, to time how long it takes to calculate the 
# square root of the numbers from one to ten million, you would write the following:




# How long does it take to read movies from CSV?
system.time(read.csv("movies.csv"))

# How long does it take to read movies from RDS?
system.time(readRDS("movies.rds"))


# Microbechmark
# Using system.time() is convenient, but it does have its drawbacks when comparing multiple function calls.
# The microbenchmark package solves this problem with the microbenchmark() function.


compare <- microbenchmark(read.csv("EPL10.csv"),
                          read_csv("EPL.csv"),
                          readRDS("EPL10.RDS"), times = 10)
install.packages("benchmarkme")


# Benchmarket: benchmarkme pachkage
# For many problems your time is the expensive part. If having a faster computer makes you more productive, it can
# be cost effective to buy one. However, before you splash out on new toys for yourself, your boss/partner may want to see some numbers to justify the expense.
# Measuring the performance of your computer is called benchmarking, and you can do that with the benchmarkme package.

# How good is your machine?
install.packages("benchmarkme")
library(benchmarkme)

# This is a tipical or sandard test (run = 3)
res <- benchmark_std(run = 3) # Cuidado que esto tarda una pasada
plot(res)


ram <- get_ram()
ram
cpu <- get_cpu()
cpu




# Run the io benchmark
res <- benchmark_io(runs = 1, size = 5)

# Plot the results
plot(res)








