library(Lahman)
library(dplyr)
library(Rcpp)
library(ggplot2)

Batting <- as_tibble(Batting)

bdat <- Batting %>%
  select(playerID, HR, yearID) %>%
  arrange(desc(HR))

# HR: Home Runs
bdat2 <- Batting %>%
  filter(HR == 50) %>%
  select(playerID, HR, yearID) %>%
  arrange(desc(HR))

# SO: Strike Outs
bdat3 <- Batting %>%
  filter(SO < 25) %>%
  select(playerID, HR, yearID) %>%
  arrange(desc(HR))
