# 选入（保留）变量
# 利用R语言强大的索引特征，用于访问对象中的元素
# 使用（,) 表示默认选择所有行|列
# 如：newdata <- leadership[, c(6:10)]

# 剔除（丢弃）变量

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
leadership

# 剔除变量 根据变量名剔除
# 挑选出leadership中q3、q4列
myvars <- names(leadership) %in% c("q3", "q4")
myvars

# 将q3、q4剔除
newdata <- leadership[!myvars]
newdata

# 根据变量编号剔除，在取列时，在下标前加上负号即表示剔除
newdata <- leadership[c(-8, -9)]
newdata

# 第三中，将列赋值为NULL，进行剔除
leadership$q3 <- leadership$q4 <- NULL
leadership
