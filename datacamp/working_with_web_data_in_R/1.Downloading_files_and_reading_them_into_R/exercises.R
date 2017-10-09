# Here are the URLs! As you can see they're just normal strings
csv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1561/datasets/chickwts.csv"
tsv_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_3026/datasets/tsv_data.tsv"


# Read a file in from the CSV URL and assign it to csv_data
csv_data <- read.csv(csv_url)

# Read a file in from the TSV URL and assign it to tsv_data
tsv_data <- read.csv(tsv_url)

# Examine the objects with head()
head(csv_data)
head(tsv_data)


# Download the file with download.file()
download.file(url = csv_url, destfile = "feed_data.csv")

# Read it in with read.csv()

csv_data <- read.csv("feed_data.csv")



# Add a new column: square_weight
csv_data$square_weight <- csv_data$weight^2

# Save it to disk with saveRDS()
saveRDS(csv_data, "modified_feed_data.RDS")

# Read it back with readRDS()
modified_feed_data <- readRDS("modified_feed_data.RDS")

# Examine modified_feed_data
str(modified_feed_data)
##################################################################################


#### TITLE #####
## USI API CLIENTS

# So we know that APIs are server components to make it easy for your code
# to interact with a service and get data from it. 
# We also know that R features many "clients" - packages that wrap around 
# connections to APIs so you don't have to worry about the details.
# 
# Let's look at a really simple API client - the pageviews package,
# which acts as a client to Wikipedia's API of pageview data.
# As with other R API clients, it's formatted as a package,
# and lives on CRAN - the central repository of R packages. 
# The goal here is just to show how simple clients are to use:
# they look just like other R code, because they are just like other R code.


# Load pageviews
install.packages("pageviews")
library(pageviews)

# Get the pageviews for "Hadley Wickham"

# Get the pageviews for "Hadley Wickham"
hadley_pageViews <- article_pageviews(project = "en.wikipedia", "Hadley Wickham")
# Examine the resulting object
str(hadley_pageViews)


### TITLE ####
# Using access Token

# As we discussed in the last video,
# it's common for APIs to require access tokens
# - unique keys that verify you're authorised to use a service.
# They're usually pretty easy to use with an API client.
# 
# To show how they work, and how easy it can be, 
# we're going to use the R client for the Wordnik dictionary and word use service
# - 'birdnik' - and an API token we prepared earlier.
# Birdnik is fairly simple (I wrote it!) and lets you get all sorts of interesting
# information about word usage in published works. For example, to get the frequency
# of the use of the word "chocolate", you would write:
# 
# 
#  " word_frequency(api_key, "chocolate")"
# In this exercise we're going to look at the word "vector" (since it's a common word in R!)
# using a pre-existing API key (stored as api_key)

# Load birdnik
install.packages("birdnik")
library(birdnik)

# Get the word frequency for "vector", using api_key to accsess it
vector_frequency <- word_frequency(api_key, "vector") # It doesn't work because obvius reasons



        
        
        
        




