#------------------------------------------------------------#
# Chapter 28                                                 #
#------------------------------------------------------------#
# Creating a dataframe
patientID <- c(1, 2, 3, 4)
admdate <- c("10/15/2009","11/01/2009","10/21/2009","10/28/2009")
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
data <- data.frame(patientID, age, diabetes, status)
data
data2 <- data.frame(patientID=character(0), age=numeric(0),
                    diabetes=character(), status=character())
data2 <- edit(data2)
fix(data2)
#Reading file from Database
install.packages("RODBC")


#------------------------------------------------------------#
# Chapter 29                                                 #
#------------------------------------------------------------#
x <- read.table ("input.txt")
x
head(x)
x <- read.table ("input.csv")
x <- read.table ("input.csv",sep=",")
x <- read.table ("input.csv",sep=",",header = T)
x <- read.table ("input.test.txt",sep=",",header = T,skip = 5)
x <- read.table ("input.csv",sep=",",header = T,nrows = 100)
x <- read.table ("input.csv",sep=",",header = T,skip = 50,nrows = 100)
x <- read.table ("input.csv",sep=",",header = T,skip = 50,nrows = 100,
                 na.strings = " ")
x <- read.table ("input.csv",sep=",",header = T,skip = 50,nrows = 100,
                 stringsAsFactors = F)
?read.table
x <- read.csv ("input.csv",header = T)


#------------------------------------------------------------#
# Chapter 30                                                 #
#------------------------------------------------------------#
x <- read.table("https://codeload.github.com/mperdeck/LINQtoCSV/zip/master",
           header = TRUE)
install.packages("XML")
require(XML)
readHTMLTable("https://en.wikipedia.org/wiki/World_population",which=3)

RSiteSearch("Matlab")
x <- read.table(gzfile("input.txt.gz"))
x <- read.table("clipboard")
x <- readClipboard()
x <- readLines("input.txt",n=100)
world.series <- scan ("http://lib.stat.cmu.edu/datasets/wseries",skip=35,
                     nlines = 23,what = list(year=integer(0),pattern=character(0)))
x <- scan("scan.txt",what=list (character(3),numeric(0),numeric(0)))
x <- scan("scan.txt",what=list (X1=character(3),X2=numeric(0),X3=numeric(0)))

#------------------------------------------------------------#
# Chapter 31                                                 #
#------------------------------------------------------------#
?write
?write.table
?write.csv
getwd()
write.table (x,file=newfile.txt)
write.table (x,file=newfile.csv,sep="\t")
write.table (x,file=newfile.csv,sep="\t",quote=FALSE,append=FALSE,na="NA")
write.table (x,file=gzfile (newfile.csv.gz),sep="\t",
             quote=FALSE,append=FALSE,na="NA")
library(foreign)
write.arff()

#------------------------------------------------------------#
# Chapter 32                                                 #
#------------------------------------------------------------#
read.csv("input.csv",header = T)
install.packages("XLConnect")
library(XLConnect)
?loadWorkbook
#Two step Read Excel File
ex <- loadWorkbook ("data.xlsx")
edata <- readWorksheet(ex,1)
head(edata)
edata <- readWorksheet(ex,1,startRow=0,starCol=0,endRow=50,endCol=3)

#One step Read Excel File
readWorksheetFromFile ("data.xlsx",1,startRow=0,starCol=0,
                       endRow=50,endCol=3,header=TRUE)
#Four step Wtire Excel File
wb <- loadWorkbook("file.xlsx",create=TRUE)
createSheet(wb,"Sheet 1")
writeWorksheet(wb,data=mtcars,sheet = "Sheet 1")
saveWorkbook()

#One step Wtire Excel File
writeWorksheetToFile("file.xlsx",data = mtcars,sheet = "Sheet 1")
vignette("XLConnect")

#Packages xlsx
install.packages("xlsx")
library(xlsx)
rdata <- read.xlsx("data.xlsx",n=1,startRow = 1,endRow = 100)
write.xlsx(rdata,file = "rdata.xlsx",sheetName = "Sheet 1",append = F)
help(package="xlsx")

#------------------------------------------------------------#
# Chapter 33                                                 #
#------------------------------------------------------------#
?iris
head(iris)
getwd()
dir()
saveRDS(iris,file="iris.RDS")
rdsdata <- readRDS("C:/Users/wangtong/Desktop/RData/iris.RDS")
#Write RData file
load(file = "C:/Users/wangtong/Desktop/RData/Ch02.R")
save(iris,iris3,file = "iris.Rdata")
save.image()


#------------------------------------------------------------#
# Chapter 34                                                 #
#------------------------------------------------------------#
library(xlsx)
cars32 <- read.xlsx("mtcars.xlsx",sheetIndex = 1,header = T)
is.data.frame(cars32)
is.data.frame(state.x77)
dstate.x77 <- as.data.frame(state.x77)
is.data.frame(dstate.x77)
as.matrix(data.frame(state.region,dstate.x77))
as.vector(dstate.x77)
as.factor(dstate.x77)
methods(is)
methods(as)
x <- state.abb
dim(x) <- c(5,10)
x <- state.abb
as.factor(x)
as.list(x)
state <- data.frame(x,state.region,state.x77)
state$Income
state["Nevada",]
unname(state)
unlist(state)

#------------------------------------------------------------#
# Chapter 35                                                 #
#------------------------------------------------------------#
getwd()
list.files()
who <- read.csv("WHO.csv",header = T)
who1 <- who[c(1:50),c(1:10)]
who2 <- who[c(1,3,5,8),c(2,14,16,18)]
who3 <- who[which(who$Continent==7),]
who4 <- who[which(who$CountryID>50 & who$CountryID<=100),]
#subset
?subset
who3=subset(who,who$CountryID>50 & who$CountryID<=100)
?sample
x <- 1:100
sample(x,30)
sample(x,30,replace = T)
sample(x,60,replace = F)
sort(sample(x,60,replace = T))
who3=who[sample(who$CountryID,30,replace = F),]

mtcars[,-1:-5]
mtcars$mpg <- NULL
USArrests
data.frame(state.division,USArrests)
cbind(USArrests,state.division)
data1 <- head(USArrests,20)
data2 <- tail(USArrests,20)
data3 <- head(cbind(USArrests,state.division),20)
rbind(data3,data2)

data1 <- head(USArrests,30)
data2 <- tail(USArrests,30)
data4 <- rbind(data1,data2)
rownames(data4)
length(rownames(data4))
duplicated(data4)
data4[duplicated(data4),]
data4[!duplicated(data4),]
unique (data4)
#------------------------------------------------------------#
# Chapter 36                                                 #
#------------------------------------------------------------#
mtcars
sractm <- t(mtcars)
letters
rev(letters)
womenwomen[rev(rownames(women)),]
transform(women, height = height*2.54)
transform(women, cm = height*2.54)
#sort order rank
sort(rivers)
sort(state.name)
rev(sort(rivers))
mtcars[sort(rownames(mtcars)),]
sort(rivers)
order (rivers)
mtcars[order(mtcars$mpg),]
mtcars[order(-mtcars$mpg),]
order(mtcars$mpg,mtcars$disp)

#------------------------------------------------------------#
# Chapter 37                                                 #
#------------------------------------------------------------#
WorldPhones
worldphones <- as.data.frame(WorldPhones)
rs <- rowSums(worldphones)
cm <- colMeans(worldphones)
total <- cbind(worldphones,Total=rs)
rbind(total,cm)

#apply series
apply
apply(WorldPhones,MARGIN = 1,FUN = sum)
apply(WorldPhones,MARGIN = 2,FUN = mean)

#lapply and sapply
state.center
lapply(state.center,FUN = length)
sapply(state.center,FUN = length)
#tapply
state.name
state.division
tapply(state.name,state.division,length)

#scale and center
state.x77
heatmap(state.x77)

x <- c(1,2,3,6,3)
mean(x)
x - mean(x)

sd(x)
(x -mean(x))/sd(x)
?scale
scale(state.x77,center = T)
scale(state.x77,scale = T)
x <- scale(state.x77,scale = T,center = T)
heatmap(x)
#------------------------------------------------------------#
# Chapter 38                                                 #
#------------------------------------------------------------#
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5),
                data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5),
                data = 1:5)
merge(x, y, by = "k1")
merge(x, y, by = c("k1","k2")) 
install.packages("reshape2")
?melt
?dcast
?acast
names(airquality) <- tolower(names(airquality))
head(airquality)

aql <- melt(airquality) 
head(aql)

aql <- melt(airquality, id.vars = c("month", "day"))
head(aql)

aqw <- dcast(aql, month + day ~ variable)
head(aqw)

head(airquality) 
dcast(aql, month ~ variable)
dcast(aql, month ~ variable, fun.aggregate = mean, na.rm = TRUE)

#------------------------------------------------------------#
# Chapter 39                                                 #
#------------------------------------------------------------#
install.packages(c("tidyr","dplyr"))
tdata <- mtcars[1:10,1:3]
tdata <- data.frame(name=rownames(tdata),tdata)
gather(tdata,key = "Key",value = "Value",cyl,disp,mpg)
gather(tdata,key = "Key",value = "Value",cyl:disp)
gather(tdata,key = "Key",value = "Value",mpg,cyl,-disp)
spread(gdata,key = "Key",value = "Value")
df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
separate(df,col=x,into = c("A","B"))
df <- data.frame(x = c(NA, "a.b-c", "a-d", "b-c"))
separate(df,x,into = c("A","B"),sep = "-")
unite(x,col ="AB",A,B,sep="-")

#------------------------------------------------------------#
# Chapter 40                                                 #
#------------------------------------------------------------#
library(dplyr)
ls("package:dplyr")
dplyr::filter (iris,Sepal.Length >7)
dplyr::distinct(rbind(iris[1:10,],iris[1:15,]))
dplyr::slice(iris,10:15)
dplyr::sample_n(iris,10)
dplyr::sample_frac(iris,0.1)
dplyr::arrange(iris,Sepal.Length)
dplyr::arrange(iris,desc(Sepal.Length))
summarise(iris,avg=mean(Sepal.Length))
summarise(iris,sum=sum(Sepal.Length))
head(mtcars,20) %>% tail()
dplyr::group_by(iris,Species)
iris %>% group_by(Species) %>% summarise(avg=mean(
  Sepal.Width)) %>% arrange(avg)
dplyr::mutate(iris,new=Sepal.Length+Petal.Length)

#Connecte
a=data.frame(x1=c("A","B","C"),x2=c(1,2,3))
b=data.frame(x1=c("A","B","D"),x3=c(T,F,T))
dplyr::left_join(a,b,by="x1")
dplyr::full_join(a,b,by="x1")
dplyr::semi_join(a,b,by="x1")
dplyr::anti_join(a,b,by="x1")

first <- slice(mtcars,1:20)
mtcars <- mutate(mtcats,Model=rownames(mtcars))
first <- slice(mtcars,1:20)
second <- slice (mtcars,10:30)
intersect(first, second)
union_all(first, second)
union(first, second)
setdiff(first, second)
setdiff(second, first) 


