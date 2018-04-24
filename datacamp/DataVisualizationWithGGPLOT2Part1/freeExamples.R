library(MASS)
library(ggplot2)
library(dplyr)

#1
ggplot(mammals, aes(x = body, y = brain)) +
  geom_point() + stat_smooth(method = "lm", col = "red", se = TRUE)


ggplot(mammals, aes(x = body, y = brain)) +
  geom_point(alpha = 0.6) +
  coord_fixed() +
  scale_x_log10() +
  scale_y_log10()  +
  stat_smooth(method = "lm",
              col = "#C42126",
              se = FALSE, size = 1)


p <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))
p + geom_point()
p + geom_jitter()


##

carModel <- lm(mpg ~ wt, data = mtcars)

mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

lapply(levels(mtcars$cyl), function(x){
  abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")


# Todo esto con ggplot se hace asi

ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2)
  




# tidyr

iris.tidy <- iris %>%
  gather(key, value, -Species) %>%
  separate(key, c("Part", "Measure"), "\\.")




# Clean up the axes with scale_ functions
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab)

cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
cyl.am + geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") +
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission",
                    values = c("#E41A1C", "#377EB8"))


stripchart(mtcars$mpg)

ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_point() +
  scale_y_continuous(limits = c(-4,4))

ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_jitter() +
  scale_y_continuous(limits = c(-4,4))



ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5)

ggplot(diamonds, aes(x = clarity, y = carat, col = price)) +
  geom_point(alpha = 0.5, position = "jitter")




#####################################################################

#Load ggplot default data: Diamonds
library(ggplot2)
library(gridExtra)
data(diamonds)
head(diamonds)



diamonds <- diamonds[diamonds$color < "J", ]

B1 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Set1") + labs(title = "Palette = ''Set1''\n")

B2 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Set2") + labs(title = "Palette = ''Set2''\n")

B3 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Paired") + labs(title = "Palette = ''Paired''\n")


B4 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Pastel2") + labs(title = "Palette = ''Pastel2''\n")



Brewers <- grid.arrange(B1, B2, B3, B4, ncol = 2)

B5 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Blues") + labs(title = "Palette = ''Blues''\n")

B6 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Oranges") + labs(title = "Palette = ''Oranges''\n")

B7 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Reds") + labs(title = "Palette = ''Reds''\n")


B8 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="Purples") + labs(title = "Palette = ''Purples''\n")



Brewers.2 <- grid.arrange(B5, B6, B7, B8, ncol = 2)



B9 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="RdYlGn") + labs(title = "Palette = ''RdYlGn''\n")

B10 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="RdBu") + labs(title = "Palette = ''RdBu''\n")

B11 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="PRGn") + labs(title = "Palette = ''PRGn''\n")


B12 <- ggplot(data = diamonds) + 
  geom_point(aes(x = carat, y = price, color = color)) +
  facet_wrap(~color) + 
  scale_colour_brewer(palette="BrBg") + labs(title = "Palette = ''BrBg''\n")



Brewers.3 <- grid.arrange(B9, B10, B11, B12, ncol = 2)


m <- c()


