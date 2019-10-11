# 可以使用order()函数，对一个数据框进行排序  默认为升序
# 排序变量的前边加一个减号，即可得到降序排序结果

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

attach(leadership)

# 根据年龄-升序排列
newdata <- leadership[order(age), ]
newdata

# 先按照性别排序，然后按照年龄降序排序
# 这里gender会根据字母的ASCII码进行排序，F < M
leadership <- leadership[order(gender, -age),]
leadership

detach(leadership)
