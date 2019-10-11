# NA 表示缺失值，即不知道值是多少，但有
# NaN 表示非数值，not a Number
# is.na() 可以检测缺失值是否存在，他会返回一个相同大小的对象，如果元素是缺失值，则相应位置会被
# 填充为TRUE，而不是缺失值的位置则为FALSE
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
leadership <- data.frame(manager, date, country, gender, age, q1, q2, q3, q4, q5, stringsAsFactors=F)
leadership

leadership <- within(leadership, {
  age[age >90] <- NA
})
leadership

# 使用is.na()检测都有哪些NA值
is.na(leadership[, 6:10])

# na.omit() 用于移除所有含有缺失值的观测，na.omit()可以删除含有缺失值的行
na.omit(leadership)




