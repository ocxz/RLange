# 重编码涉及 根据同一个变量/其它变量的现有值创建新值的过程
# 将一个连续型变量修改为一组类别值
# 将误编码的值替换为正确值
# 基于一组分数线创建一个表示及格/不及格的变量

# 重编码数据，需要使用R中的逻辑运算符
# <、<=、>、>=、==、!=
# 与&、或|、非!
# isTRUE(x)
# 浮点型数据慎用==，以免误判

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
leadership <- data.frame(manager, date, country, gender, age, q1, q2, q3
                         , q4, q5, stringsAsFactors=F)

# 将leadership中的age=99的改为NA
leadership$age[leadership$age==99] <- NA

# 将年龄大于75 改成”Elder"
# >=55 & <= 75  "Middle Aged"
# < 55 "Young
leadership$agecat[leadership$age > 75] <- "Elder"
leadership$agecat[leadership$age <= 75 & leadership$age >=55] <- "Middle Aged"
leadership$agecat[leadership$age <55] <- "Young"
leadership

# 使用第二种方式
# within()函数和with()函数类似，within是可以修改数据框的
leadership <- within(leadership, {
  agecat <- NA
  agecat[age > 75] <- "Elder"
  agecat[age >= 55 & age <= 75] <- "Middle Aged"
  agecat[age < 55] <- "Young"})
leadership

names(leadership)[2] <- "TestDate"
leadership
















