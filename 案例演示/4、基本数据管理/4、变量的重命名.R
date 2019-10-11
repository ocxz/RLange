# 变量重命名，可使用fix()函数，调用一个交互式的编辑器
# 使用reshap包中的rename函数，进行变量重命名
# rename的格式：rename(dataframe, c(oldname="newname, ……))
# 也可通过names(dataframe)[索引] <- "newname"
# 也可通过names(datafrme)[6:10] <- c("n1", "n2", "n3", "n4", "n5", "n6")
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

# 使用fix()函数，调用一个交互式编辑器，进行编辑
fix(leadership)

# 
library(reshape)
leadership <- rename(leadership, c(manager="manageId", date="Date"))
leadership

