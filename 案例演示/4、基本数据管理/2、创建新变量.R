# 创建新变量 或对现有变量进行变换
# 格式： 变量名 <- 表达式
# 算术运算符：^|** 求幂  x%%y 求余   
# 求幂：^或者**
# 求余：x%%y  x mod y
# 整除：x%/%y   如：5 %/% 2 = 2

# 第一种
mydata <- data.frame(x1=c(2, 2, 6, 4), x2=c(3, 4, 2, 8))
mydata$sumx <- mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2) / 2
mydata

# 第二种
attach(mydata)
mydata$sumx <- x1 + x2
mydata$meanx <- (x1 + x2) /2
mydata
detach(mydata)

# 第三种 使用transform()进行转换
mydata <- transform(mydata, sumx = x1 + x2, meanx = (x1 + x2) / 2)
mydata

