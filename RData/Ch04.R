#------------------------------------------------------------#
# Chapter 41                                                 #
#------------------------------------------------------------#
state <- as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
fit<- lm (Murder ~ Population+Illiteracy+Income+Frost,data=state)

ls()
Sys.Date()
a <- 1:100
rm(a)
?heatmap
help(sort)
help(heatmap)

#------------------------------------------------------------#
# Chapter 42                                                 #
#------------------------------------------------------------#
ls("package:base")
par()
length(par())
?sum
?read.table
library(scatterplot3d)
?scatterplot3d
?plot
plot(c(1:20),c(seq(1,89,length.out = 20)),type="l",lty=1)
plot(c(1:20),c(seq(1,89,length.out = 20)),type="l",lty=2)


#------------------------------------------------------------#
# Chapter 43                                                 #
#------------------------------------------------------------#
round(rnorm(n=100,mean = 15,sd=2))
?Geometric
?Hypergeometric
x=rnorm(n=100,mean = 15,sd=2)
qqnorm(x)
runif(1)
runif(50)
runif(10)*10
runif(50,min=1,max=100)
dgamma(c(1:9),shape = 2,rate = 1)
set.seed(666)
runif(50)
runif(50)
set.seed(666)
runif(50)

#------------------------------------------------------------#
# Chapter 44                                                 #
#------------------------------------------------------------#
myvars <- mtcars[c("mpg", "hp", "wt", "am")]
summary(myvars)
fivenum(myvars$hp)

#Descriptive stats via describe (Hmisc)
install.packages("Hmisc")
library(Hmisc)
myvars <- c("mpg", "hp", "wt")
describe(mtcars[myvars])


#Descriptive stats via stat.desc (pastecs)
install.packages("pastecs")
library(pastecs)
stat.desc(mtcars[myvars])
stat.desc(mtcars,basic = TRUE,desc = TRUE,norm = TRUE)

#Descriptive stats via describe (psych)
library(psych)
describe(mtcars[myvars],trim = 0.1)
Hmisc::describe(mtcars)

#Descriptive stats by group with aggregate
library(MASS)
aggregate(Cars93[c("Min.Price","Price","Max.Price","MPG.city")],
          by=list(Manufacturer=Cars93$Manufacturer),mean)
aggregate(Cars93[c("Min.Price","Price","Max.Price","MPG.city")],
          by=list(Manufacturer=Cars93$Manufacturer),sd)
aggregate(Cars93[c("Min.Price","Price","Max.Price","MPG.city")],
          by=list(Origin=Cars93$Origin),mean)
aggregate(Cars93[c("Min.Price","Price","Max.Price","MPG.city")],
          by=list(Origin=Cars93$Origin),sd)
aggregate(Cars93[c("Min.Price","Price","Max.Price","MPG.city")],
          by=list(Origin=Cars93$Origin,Manufacturer=Cars93$Manufacturer),mean)
#Descriptive stats by group with by
mystats <- function(x){
  m <- mean(x)
  s <- sd(x)
  return(c(mean=m, stdev=s))
}
dstats <- function(x)sapply(x,mystats)
by(mtcars[myvars], mtcars$am, dstats)

#Descriptive stats by group via summaryBy
install.packages("doBy")
library(doBy)
summaryBy(mpg+hp+wt~am, data=mtcars, FUN=mystats)


#Descriptive stats by group via describe.by (psych)
library(psych)
describeBy(mtcars[myvars], list(am=mtcars$am))


#------------------------------------------------------------#
# Chapter 45                                                 #
#------------------------------------------------------------#
# frequency tables
split(mtcars,mtcars$cyl)
split(mtcars,as.factor (mtcars$cyl))
num <- 1:100
cut(num,c(seq(0,100,10)))
cut(mtcars$mpg,c(seq(10,50,10)))
table(mtcars$cyl)
table(cut(mtcars$mpg,c(seq(10,50,10))))

prop.table(table(mtcars$cyl))
prop.table (table(cut(mtcars$mpg,c(seq(10,50,10)))))
prop.table(table(mtcars$cyl))*100

library(vcd)
head(Arthritis)

# one way table
mytable <- with(Arthritis, table(Improved))
mytable  # frequencies
prop.table(mytable) # proportions
prop.table(mytable)*100 # percentages


# two way table
mytable <- table(Arthritis$Treatment,Arthritis$Improved)
with(data = Arthritis,{table(Treatment,Improved)})
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
mytable # frequencies
margin.table(mytable,1) #row sums
margin.table(mytable, 2) # column sums
prop.table(mytable) # cell proportions
prop.table(mytable, 1) # row proportions
prop.table(mytable, 2) # column proportions
addmargins(mytable) # add row and column sums to table


mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
mytable
ftable(mytable) 
margin.table(mytable, 1)
margin.table(mytable, 2)
margin.table(mytable, 2)
margin.table(mytable, c(1,3))
ftable(prop.table(mytable, c(1,2)))
ftable(addmargins(prop.table(mytable, c(1, 2)), 3))



#------------------------------------------------------------#
# Chapter 46                                                 #
#------------------------------------------------------------#

library(vcd)
mytable <- table(Arthritis$Treatment,Arthritis$Improved)
#mytable <- xtabs(~Treatment+Improved, data=Arthritis)
chisq.test(mytable)

mytable <- table(Arthritis$Treatment,Arthritis$Improved)
chisq.test(mytable)

mytable <- table(Arthritis$Sex,Arthritis$Improved)
chisq.test(mytable)

# Fisher's exact test
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
fisher.test(mytable)


# Chochran-Mantel-Haenszel test
mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mantelhaen.test(mytable)



#------------------------------------------------------------#
# Chapter 47                                                 #
#------------------------------------------------------------#

cor(state.x77)
cor(state.x77, method="spearman")
cov(state.x77)

#x <- states[,c("Population", "Income", "Illiteracy", "HS Grad")]
x <- state.x77[,c(1,2,3,6)]
#y <- states[,c("Life Exp", "Murder")]
y <- state.x77[,c(4,5)]
cor(x,y)


# partial correlations
install.packages("ggm")
library(ggm)
# partial correlation of population and murder rate, controlling
# for income, illiteracy rate, and HS graduation rate
colnames(state.x77)
pcor(c(1,5,2,3,6), cov(state.x77))


#------------------------------------------------------------#
# Chapter 48                                                 #
#------------------------------------------------------------#
#Testing a correlation coefficient for significance
cor.test(state.x77[,3],state.x77[,5])


#Correlation matrix and tests of significance via corr.test
corr.test(states, use="complete")
library(psych)
corr.test (state.x77)
library(ggm)
x <- pcor(c(1,5,2,3,6),cov(state.x77))
pcor.test(x,3,50)
# t test
library(MASS)
t.test(Prob ~ So, data=UScrime)


# dependent t test
sapply(UScrime[c("U1","U2")], function(x)(c(mean=mean(x),sd=sd(x))))
with(UScrime, t.test(U1, U2, paired=TRUE))


# Wilcoxon two group comparison
with(UScrime, by(Prob, So, median))
wilcox.test(Prob ~ So, data=UScrime)

sapply(UScrime[c("U1", "U2")], median)
with(UScrime, wilcox.test(U1, U2, paired=TRUE))


# Kruskal Wallis test
states <- data.frame(state.region, state.x77)
kruskal.test(Illiteracy ~ state.region, data=states)


#Nonparametric multiple comparisons
source("http://www.statmethods.net/RiA/wmc.txt")              
states <- data.frame(state.region, state.x77)
wmc(Illiteracy ~ state.region, data=states, method="holm")

#------------------------------------------------------------#
# Chapter 49                                                 #
#------------------------------------------------------------#
ls("package:graphics")
help(package=graphics)
plot (women$height)
plot(women$height,women$weight)
plot(as.factor(women$height))
plot(mtcars$cyl)
plot(as.factor(mtcars$cyl))
plot(as.factor(mtcars$cyl),mtcars$carb)
plot(as.factor(mtcars$carb),as.factor(mtcars$cyl))
plot (women$height~ women$weight)
fit <- lm(height~ weight,data=women)
plot(fit)
methods(plot)
par()
?par
plot(as.factor(mtcars$cyl),col=c("red","green","blue"))


#------------------------------------------------------------#
# Chapter 50                                                 #
#------------------------------------------------------------#

mystats <- function(x,na.omit=FALSE) {
  if(na.omit) 
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m^3/s^3))/n
  kurt <- sum((x-m^4/s^4))/n-3
  return(c(n=n,mean=m,stdev=s,skew=skew,kurtosis=kurt))
 }

for (i in 1:10) {print ("Hello,World")}
#for ($i=1;$i<=10;$++) {print "hello,world\n";}
i=1;while(i <= 10) {print ("Hello,World");i=i+1;}
i=1;while(i <= 10) {print ("Hello,World");i=i+2;}
score=70;if (score >60 ) {print ("Passwd") } else {print ("Failed")}
ifelse( score >60,print ("Passwd"),print ("Failed"))

#switch
centre <- function(x, type) {
  switch(type,
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
x <- rcauchy(10)
centre(x, "mean")
centre(x, "median")
centre(x, "trimmed")


