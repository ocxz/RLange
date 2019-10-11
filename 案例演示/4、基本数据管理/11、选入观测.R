# 选入或剔除观测（行）通常是成功数据准备和数据分析的一个关键方面
# 选入观测案例

# 填入数据
manager <- 1:5
date <- c("10/24/08", "10/28/08", "10/01/08", "10/01/08", "05/01/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <-c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age, 
                         q1, q2, q3, q4, q5, stringsAsFactors=F)

# 取出leadership数据框中的1-3行
newdata <- leadership[1:3, ]

# 选取其中gender="M 且 age > 30
# 逻辑比较：leadership$gender == "M"  生成向量 c(TRUE, FALSE, FALSE, TRUE, FALSE)
# 逻辑比较：leadership$age > 30  生成向量 c(TRUE, TRUE, FALSE, TRUE, TRUE)
# 两者做 & 得到 c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE)
# 函数which()得到向量值中为TRUE的下标，即which(c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE))
# 得到c(1, 4)
newdata <- leadership[which(
  leadership$gender == "M" &
  leadership$age > 30),]

newdata

# 年份限定
# 年份转换
leadership$date <- as.Date(leadership$date, "%y/%d/%m")
# 设置开始日期
startDate <- as.Date("2009-01-01")
# 设置结束日期
endDate <- as.Date("2009-10-31")
# 年份选取
newData <- leadership[which(
  leadership$date >= startDate &
  leadership$date <= endDate), ]
newdata

# subset() 函数
# 使用subset() 函数可以极大方便的选择变量和观测
newData <- subset(leadership, age >= 35 | age < 24, select = c(q1, q2, q3, q4))
newData

newData <- subset(leadership, gender=="M" & age > 25, select=gender:q4)
newData

# 随机取样：在数据挖掘和机器学习领域，从大数据集中抽样是很常见的事
# sample()函数，可以从数据框中（有放回或无放回）地抽取大小为n地随机样本
# 例如 可以从leadership 数据集中随机抽取一个大小为3地样本
# sample() : 第一个参数是选取行地范围，第二个参数是样本大小，第三个参数表示无放回抽样
mysample <- leadership[sample(1:nrow(leadership), 3, replace=F),]
mysample



