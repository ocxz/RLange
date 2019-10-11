# 将函数应用于数据对象
# 准备数据
a <- 5

# 开跟
sqrt(a)

# 四舍五入
b <- c(1.243, 5.654, 2.99)
round(b)

# 生成服从正态分布随机矩阵
c <- matrix(runif(12), nrow=3)
c

# 开自然对数
log(c)

# 求均值
mean(c)



# 下面的演示：将一个函数应用到矩阵的所有行列中
mydata <- matrix(rnorm(30), nrow=6)
mydata

# 使用apply函数，计算
# 格式：apply(x, MARGIN, FUN, ……)
# MARGIN：维度下标，为1表示行，为2表示列
# FUN：可以为任意R函数
# 计算mydata矩阵中每一行的均值
apply(mydata, 1, mean)
# 计算mydata矩阵中每一列的均值
apply(mydata, 2, mean)
# 计算每一列的截尾均值，也就是说最高值的20%和最低值的20%被忽略
apply(mydata, 2, mean, trim=0.2)


