# 常用的统计函数
# 1、平均数：mean(x)
# 2、中位数：median(x)
# 3、标准差：sd(x)
# 4、方差：var(x)
# 5、绝对中位差：mad(x)
# 6、分位数：quantile(x, probs)   probs 为一个有[0,1]直接概率组成的数值向量
# 7、值域：range(x)   也就是最大值减去最小值
# 8、求和：sum(x)
# 9、滞后差分：diff(x, lag=n)  lag表示滞后几项，默认为1
# 10、最小值：min(x)
# 11、最大值：max(x)
# 12、标准化：scale(x, center=T, scale=T)  中心化：center=T  标准化：scale=T

# 均值和方差的计算
x <- 1:8

# 使用统计函数求均值
mean(x)
# 使用统计函数求方差
sd(x)

# 利用数学公式计算
n <- length(x)
# 求均值
meanx <- sum(x) / n
# 求方差
css <- sum((x - meanx)^2)  # 求修正平方和
sdx <- sqrt(css / (n-1))
meanx
sdx

# 数据的标准化，默认情况下使用scale() 对矩阵或数据框的指定列进行均值为0、标准差为1的标准化
# 如：newdata <- scale(mydata)

# 对每一列进行任意均值和标准差的标准化
# newdata <- scale(mydata) * SD + M 其中SD是标准差，M为均值

# 对数据框或矩阵的指定列进行标准化
# 如：newdata <- transform(mydata, myvar = scale(myvar) * 10 + 50)
# 将myvar变量标准化为：均值为50，标准差为10的变量
  
  
  
