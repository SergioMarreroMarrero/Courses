library(rlist)
library(pipeR)
library(httr)
library(jsonlite)

# mapping


url <- "https://renkun-ken.github.io/rlist-tutorial/data/sample.json"
people <- list.load(url)
str(people)

lapply(people, function(x) {x$Name} )

list.map(people, Age)
list.map(people, sum(as.numeric(Expertise)))
list.map(people, list(age=Age, range=range(as.numeric(Expertise))))
list.map(people, Expertise)

nums <- c(a = 3, b = 2, c = 1)


list.map(nums, . + 1) # . itself
list.map(nums, .i) # its index
list.map(nums, .name) # its name


list.map(nums, paste0("name: ", .name))

# Vectors instead of lists
unlist(list.map(people, Age))
list.mapv(people, Age)


# list.selec
list.select(people, Name, Age)

list.select(people, Name, Age, nlang = length(Expertise))
str(people, max.level = 2)

# list.maps (ojo: en plural)
l1 <- list(p1 = list(x = 1, y = 2 ), p2 = list(x = 3, y = 4 ), p3 = list(x = 1, y = 3 ))
l2 <- list(2, 3, 5)
list.maps(a$x*b + a$y, a = l1, b = l2)



# PRUEBAS
list.map(people,  Name)
list.select(people, Name, Age )
# Filtering
people %>%
  list.filter(Age >= 20) %>%
  list.select(Name, Age)


people %>%
  list.filter("music" %in% Interests) %>%
  list.mapv(Name)

people %>%
  list.filter(mean(as.numeric(Expertise)) >= 3) %>%
  list.mapv(Name)


# list.find
people %>%
  list.find(Age >= 20, 3) %>%
  list.mapv(Name)


list.findi(people, Age >= 23, 1)

list.first(people, Age >= 23)
list.last(people, Age >= 23)


list.take(1:10, 3)

# It keeps takin elements while a condition holds true

people %>%
list.takeWhile(Expertise$R >= 2) %>%
  list.map(list(Name = Name, R = Expertise$R)) 
  
  
# Difference between map and list
m <- list.map(people, list(Name = Name, R = .$Expertise$R))
s <- list.select(people, list(Name = Name, R = .$Expertise$R))
s2 <- list.select(people, Name = Name , RR = Expertise$R)


# list.skipwhile()
people %>%
  list.skipWhile( Expertise$R <= 2) %>%
  list.map(list(Name = Name, R = Expertise$R)) %>%
  str






