library(LearnBayes)

data(studentdata)
studentdata
studentdata[1,]

attach(studentdata)
table(Drink)

dat <- table(Dvds)
barplot(dat, xlab = "Drink", ylan = "Count")
hist(Dvds)
table(Dvds)
summary(Dvds)


dnorm(0)*sqrt(2*pi)
dnorm(0, mean = 4)

x1 <- seq(-10,10, by = .01)
density <- dnorm(x1, mean = 3 , sd = 12)
proba_acum <- pnorm(x1, mean = 3 , sd = 12)


plot(x1, density)
plot(x1, proba_acum)


pnorm(0)

v <- c(0,1,1.96)
pnorm(v)


td <- dt(x1, df = 5)
plot(x1,td)
?dt
