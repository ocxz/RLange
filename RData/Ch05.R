#------------------------------------------------------------#
# Chapter 52                                                 #
#------------------------------------------------------------#
women
?lm
fit <- lm(weight ~ height, data=women)
summary(fit)
women$weight
fitted(fit)



#------------------------------------------------------------#
# Chapter 53                                                 #
#------------------------------------------------------------#
fit <- lm(weight ~ height, data=women)
coefficients(fit)
women$weight-fitted(fit)
residuals(fit)
women1 <- head(women,6)
predict(fit,women1)
plot(women$height,women$weight,
     main="Women Age 30-39", 
     xlab="Height (in inches)", 
     ylab="Weight (in pounds)")
# add the line of best fit
abline(fit)

#fit2
fit2 <- lm(weight ~ height + I(height^2), data=women)
summary(fit2)
summary(fit)
plot(women$height,women$weight,
     main="Women Age 30-39",
     xlab="Height (in inches)",
     ylab="Weight (in lbs)")
lines(women$height,fitted(fit2))
abline(fit)
lines(women$height,fitted(fit2),col="red")

# fit3
fit3 <- lm (weight~ height+I(height^2)+I(height^3),data=women)
plot(women$height,women$weight)
lines(women$height,fitted(fit))
lines(women$height,fitted(fit2),col="red")
lines(women$height,fitted(fit3),col="blue")

#------------------------------------------------------------#
# Chapter 54                                                 #
#------------------------------------------------------------#
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
summary(fit)
coef(fit)
qqPlot(fit, labels=row.names(states), id.method="identify",
       simulate=TRUE, main="Q-Q Plot")


# Mutiple linear regression with a significant interaction term
fit <- lm(mpg ~ hp + wt + hp:wt, data=mtcars)
summary(fit)

library(effects)
plot(effect("hp:wt", fit,, list(wt=c(2.2, 3.2, 4.2))), multiline=TRUE)

# AIC
fit1 <- lm (Murder ~ Population+Illiteracy+Income+Frost,data=states)
fit2 <- lm (Murder ~ Population+Illiteracy,data=states)
AIC(fit1,fit2)

# Backward stepwise selection
library(MASS)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost,
          data=states)
stepAIC(fit, direction="backward")


#  All subsets regression
library(leaps)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
leaps <-regsubsets(Murder ~ Population + Illiteracy + Income +
                     Frost, data=states, nbest=4)
plot(leaps, scale="adjr2")

#------------------------------------------------------------#
# Chapter 55                                                 #
#------------------------------------------------------------#
opar <- par(no.readonly=TRUE)
fit <- lm(weight ~ height, data=women)
par(mfrow=c(2,2))
plot(fit)
par(opar)

fit2 <- lm(weight ~ height + I(height^2), data=women)
opar <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
plot(fit2)
par(opar)

#------------------------------------------------------------#
# Chapter 56                                                 #
#------------------------------------------------------------#
?aov

#------------------------------------------------------------#
# Chapter 57                                                 #
#------------------------------------------------------------#
library(multcomp)
attach(cholesterol)
table(trt)     
aggregate(response, by=list(trt), FUN=mean) 
#aggregate(response, by=list(trt), FUN=sd) 
fit <- aov(response ~ trt,data =cholesterol )                                  
summary(fit)
fit.lm <- lm(response~trt,data=cholesterol)

# One-way ANCOVA
data(litter, package="multcomp")
attach(litter)
table(dose) 
aggregate(weight, by=list(dose), FUN=mean)
fit <- aov(weight ~ gesttime + dose)                             
summary(fit)

# Two way ANOVA
attach(ToothGrowth)
table(supp,dose)
aggregate(len, by=list(supp,dose), FUN=mean)
aggregate(len, by=list(supp,dose), FUN=sd)
class(ToothGrowth$dose)
dose <- factor(dose)
fit <- aov(len~ supp*dose,data=ToothGrowth)
summary(fit)

install.packages("HH")
library(HH)
interaction.plot(dose, supp, len, type="b", 
                 col=c("red","blue"), pch=c(16, 18),
                 main = "Interaction between Dose and Supplement Type")

# One-way MANOVA
library(MASS)
attach(UScereal)
shelf <- factor(shelf)
y <- cbind(calories, fat, sugars)
aggregate(y, by=list(shelf), FUN=mean)
cov(y)
fit <- manova(y ~ shelf)
summary(fit)
summary.aov(fit)

#------------------------------------------------------------#
# Chapter 58                                                 #
#------------------------------------------------------------#
install.packages("pwr")
library(pwr)

# Linear Models
pwr.f2.test(u=3, f2=0.0769, sig.level=0.05, power=0.90)
# ANOVA
pwr.anova.test(k=2,f=.25,sig.level=.05,power=.9)
# t tests
pwr.t.test(d=.8, sig.level=.05,power=.9, type="two.sample",  
           alternative="two.sided")
pwr.t.test(n=20, d=.5, sig.level=.01, type="two.sample", 
           alternative="two.sided")
# Correlations
pwr.r.test(r=.25, sig.level=.05, power=.90, alternative="greater")

# Tests of proportions
pwr.2p.test(h=ES.h(.65, .6), sig.level=.05, power=.9, 
            alternative="greater")
# Chi-square tests
prob <- matrix(c(.42, .28, .03, .07, .10, .10), byrow=TRUE, nrow=3)
ES.w2(prob)
pwr.chisq.test(w=.1853, df=3 , sig.level=.05, power=.9)

#------------------------------------------------------------#
# Chapter 59                                                 #
#------------------------------------------------------------#
?glm
data(breslow.dat, package="robust")
names(breslow.dat)
summary(breslow.dat[c(6, 7, 8, 10)])

attach(breslow.dat)
# fit regression
fit <- glm(sumY ~ Base + Age + Trt, data=breslow.dat, family=poisson(link="log"))
summary(fit)

# interpret model parameters
coef(fit)
exp(coef(fit))


#------------------------------------------------------------#
# Chapter 60                                                 #
#------------------------------------------------------------#
data(Affairs, package="AER")
summary(Affairs)
table(Affairs$affairs)
prop.table(table(Affairs$affairs))
prop.table(table(Affairs$gender))

# create binary outcome variable
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair, 
                           levels=c(0,1),
                           labels=c("No","Yes"))
table(Affairs$ynaffair)

# fit full model
attach(Affairs)
fit <- glm(ynaffair ~ gender + age + yearsmarried + children + 
                  religiousness + education + occupation +rating,
                data=Affairs,family=binomial())
summary(fit)

# fit reduced model
fit1 <- glm(ynaffair ~ age + yearsmarried + religiousness + 
                     rating, data=Affairs, family=binomial())
summary(fit1)

# compare models
anova(fit, fit1, test="Chisq")

# interpret coefficients
coef(fit1)
exp(coef(fit1))

# calculate probability of extramariatal affair by marital ratings
testdata <- data.frame(rating = c(1, 2, 3, 4, 5),
                       age = mean(Affairs$age),
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit1, newdata=testdata, type="response")
testdata

# calculate probabilites of extramariatal affair by age
testdata <- data.frame(rating = mean(Affairs$rating),
                       age = seq(17, 57, 10), 
                       yearsmarried = mean(Affairs$yearsmarried),
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit1, newdata=testdata, type="response")
testdata


#------------------------------------------------------------#
# Chapter 61                                                 #
#------------------------------------------------------------#
# Principal components analysis of US Judge Ratings
library(psych)
USJudgeRatings
fa.parallel(USJudgeRatings,fa="pc",n.iter = 100)
pc <- principal(USJudgeRatings, nfactors=1)
pc

# Principal components analysis Score
pc <- principal(USJudgeRatings,nfactors = 1,scores = TRUE)
pc$scores

# Principal components analysis Harman23.cor data
fa.parallel(Harman23.cor$cov, n.obs=302, fa="pc", n.iter=100,
            show.legend=FALSE, main="Scree plot with parallel analysis")

#Principal components analysis of body measurements
library(psych)
PC <- principal(Harman23.cor$cov, nfactors=2, rotate="none")
PC

#Principal components analysis with varimax rotation
rc <- principal(Harman23.cor$cov, nfactors=2, rotate="varimax")
rc


#------------------------------------------------------------#
# Chapter 62                                                 #
#------------------------------------------------------------#

options(digits=2)
library(psych)
covariances <- ability.cov$cov
# convert covariances to correlations
correlations <- cov2cor(covariances)
correlations

# determine number of factors to extract
fa.parallel(correlations, n.obs=112, fa="both", n.iter=100,
            main="Scree plots with parallel analysis")


# Principal axis factoring without rotation
fa <- fa(correlations, nfactors=2, rotate="none", fm="pa")
fa


# Factor extraction with orthogonal rotation
fa.varimax <- fa(correlations, nfactors=2, rotate="varimax", fm="pa")
fa.varimax


# Listing Factor extraction with oblique rotation
fa.promax <- fa(correlations, nfactors=2, rotate="promax", fm="pa")
fa.promax

# plot factor solution
factor.plot(fa.promax, labels=rownames(fa.promax$loadings))
fa.diagram(fa.promax, simple=FALSE)

# factor scores
fa <- fa(correlations,nfactors=2,rotate="none",fm="pa",score=TRUE)
fa.promax$weights


#------------------------------------------------------------#
# Chapter 63                                                 #
#------------------------------------------------------------#
install.packages("arules")
library(arules)
data(Groceries)
Groceries
inspect(Groceries)
fit <- apriori(Groceries,parameter = list(support=0.01,confidence=0.5))
summary(fit)
inspect(fit)


