# JSON
# Parsin JSON
# While JSON is a useful format for sharing data, 
# your first step will often be to parse it into an R object,
# so you can manipulate it with R.
# 
# The content() function in httr retrieves the content from a request.
# It takes an as argument that specifies the type of output to return.
# You've already seen that as = "text" will return the content as a character
# string which is useful for checking the content is as you expect.
# 
# If you don't specify as, the default as = "parsed" is used. 
# In this case the type of content() will be guessed based on the
# header and content() will choose an appropriate parsing function.
# For JSON this function is fromJSON() from the jsonlite package.
# If you know your response is JSON, you may want to use fromJSON() directly.
# 
# To practice, you'll retrieve some revision history
# from the Wikipedia API, check it is JSON, then parse it into a list two ways.

rev_history <- function(title, format = "json"){
  if (title != "Hadley Wickham") {
    stop('rev_history() only works for `title = "Hadley Wickham"`')
  }
  
  if (format == "json"){
    resp <- readRDS("had_rev_json.rds")
    
    # resp <- content(URL_wick)
  } else if (format == "xml"){
    resp <- readRDS("had_rev_xml.rds")
  } else {
    stop('Invalid format supplied, try "json" or "xml"')
  }
  resp  
}


# Get revision history for "Hadley Wickham"
resp_json <- rev_history("Hadley Wickham")

# Check http_type() for resp_json
http_type(resp_json)

# Examine  returned text with content()
content(resp_json, as = "text")

# Parse response with content()
content(resp_json, as = "parsed")
# Parse returned text with fromJSON()
library(jsonlite)
f <- fromJSON(content(resp_json, as = "text"))

# Manipulating parsed JSON

# As you saw in the video, the output from parsing JSON is a list.
# One way to extract relevant data from that list is to use a package
# specifically designed for manipulating lists, rlist.
# 
# rlist provides two particularly useful functions for selecting and combining
# elements from a list: list.select() and list.stack(). 
# list.select() extracts sub-elements by name from each element in a list.
# For example using the parsed movies data from the video (movies_list),
# we might ask for the title and year elements from each element:
#   
#   list.select(movies_list, title, year)
# 
# The result is still a list, that is where list.stack() 
# comes in. It will stack the elements of a list into a data frame.
# 
# list.stack
# 
# In this exercise you'll use these rlist functions to create a data
# frame with the user and timestamp for each revision.



# Load rlist
library(rlist)

# Examine output of this code
str(content(resp_json), max.level = 4)

# Store revision list
revs <- content(resp_json)$query$page$`41916270`$revisions

# Extract the user element
user_time <- list.select(revs, user, timestamp)

# Print user_time
print(user_time)

# Stack to turn into a data frame
list.stack(user_time)


# Reformatting JSON

# Of course you don't have to use rlist. 
# You can achieve the same thing by using functions from base R or the tidyverse.
# In this exercise you'll repeat the task of extracting the username and timestamp
# using the dplyr package which is part of the tidyverse.
# 
# Conceptually, you'll take the list of revisions, 
# stack them into a data frame, then pull out the relevant columns.
# 
# dplyr's bind_rows() function takes a list and turns it into a data frame.
# Then you can use select() to extract the relevant columns.
# And of course if we can make use of the %>% (pipe) operator to chain them all together.
# 
# Try it!

library(dplyr)

# Pull out revision list
revs <- content(resp_json)$query$pages$`41916270`$revisions

# Extract user and timestamp

revs %>%
  bind_rows() %>%
  select(user, timestamp)







