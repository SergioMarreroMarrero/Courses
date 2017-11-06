data(mtcars)
str(mtcars)
head(mtcars)

library(ggplot2)

p1 = qplot(mpg, wt, data = mtcars,
           xlab = "Miles/gallon", ylab = "Weight",
           main = "Miles per gallon vs. Weight")
p1

p2 = qplot(Petal.Length, Petal.Width, data = iris,
           xlab = "Petal Length",
           ylab = "Petal Width",
           main = "Sepal Length vs Width")
p2

library(gridExtra)
grid.arrange(p1, p2, ncol = 2)

hist(mtcars$mpg)
hist(mtcars$wt)

# Shapiro-Wilk normality test for mpg
shapiro.test(mtcars$mpg)
shapiro.test(mtcars$wt)

# Pearson's correlation
cor(mtcars$mpg, mtcars$wt, method = "pearson")
# In case of NAs being present spcify complete.obs
cor(mtcars$mpg, mtcars$wt, method = "pearson", use = "complete.obs")

# Is my correlation statistically significant?
# Ho: There is no association between the two variables
cor.test(mtcars$mpg, mtcars$wt)






