
#------------------------------------------------------------#
# Chapter 06                                                 #
#------------------------------------------------------------#
df <- read.table("ToothGrowth.csv",sep = ",",header = T)
table(df$supp,df$dose)
aggregate(df$len, by=list(df$supp,df$dose), FUN=mean)
aggregate(df$len, by=list(df$supp,df$dose), FUN=sd)
class(df$dose)
df$dose <- factor(df$dose)
fit <- aov(len~ supp*dose,data=ToothGrowth)
summary(fit)

install.packages("HH")
library(HH)
interaction.plot(df$dose, df$supp, df$len, type="b", 
                 col=c("red","blue"), pch=c(16, 18),
                 main = "Interaction between Dose and Supplement Type")

#------------------------------------------------------------#
# Chapter 10                                                 #
#------------------------------------------------------------#
getwd()
setwd("c:/Users/wangtong/Desktop/RData/")
list.files()
dir()
1+2
x<-3
x
x=3
5 ->x
x <<- 5
y <- sum(1,2,3,4,5)
z <- mean(1,2,3,4,5)
print(x)
ls()
ls.str()
str()
ls(all.names = TRUE)
rm(x)
x
rm(y,z)
rm (list=ls())
history()
history(25)
# system() LINUX
save.image()
q()

#------------------------------------------------------------#
# Chapter 11                                                 #
#------------------------------------------------------------#
?install.packages
install.packages(vcd)
install.packages("vcd")
.libPaths()
library()
install.packages(c("AER","ca"))
update.packages()
                

#------------------------------------------------------------#
# Chapter 12                                                 #
#------------------------------------------------------------#
.libPaths()
library()
require(vcd)
library (vcd)
search()
help( package="vcd" )
ls("package:vcd")
data(package="vcd")
detach("package:vcd")
#remove.packages("vcd")

#remove R packages
Rpack <- installed.packages()[,1]
save(Rpack,file = "Rpack.Rdata")
load("C:/Users/wangtong/Desktop/RData/Rpack.RData")
for (i in Rpack)  install.packages(i)

#------------------------------------------------------------#
# Chapter 13                                                 #
#------------------------------------------------------------#
help.start()
help(sum)
args(plot)
example(mean)
example("hist")
example("example")
demo(graphics)
help(package=ggplot2)
vignette()
vignette("xts")
??qplot
help.search(heatmap)
help.search("heatmap")
??heatmap
apropos("sum")
apropos ("sum",mod = "function")
RSiteSearch("matlab")

#------------------------------------------------------------#
# Chapter 15                                                 #
#------------------------------------------------------------#
help(package="datasets")
sunspot.year
data()
rivers
rivers <- c(1,2,3)
help("mtcars")
data(package = "MASS")
data(package = "car")
data(package = .packages(all.available = TRUE))
data(Chile,package = "car")
Chile




