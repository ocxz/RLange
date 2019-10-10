# 可使用par()函数或layout()函数，容易的组合多幅图形为一幅图形
# 而无须担心组合后的图形具体类型，这里只是关注组合他们的一般方法
# 使用par()函数参数mfrow=c(nrows, ncols) 来创建按行填充、行数为nrows，列数为ncols的图形矩阵
# 也可使用nfcol(nrows, ncols) 按列填充矩阵

# 举个图形组合的栗子
attach(mtcars)
opar <- par(no.readonly=T)
par(lty=1)

# 按行填充，2行2列
par(mfrow=c(2, 2))

plot(wt, mpg, main="Scatterplot of wt vs. mpg")

plot(wt, disp, main="Scatterplot of wt vs disp")

hist(wt, main="Histogram of wt")

boxplot(wt, main="Boxplot of wt")

par(opar)
detach(mtcars)



# 第二个示例，让我们依3行1列 排3幅图形
attach(mtcars)
opar <- par(no.readonly=T)
par(lty=1)
par(mfrow=c(3, 1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)


# 使用layout函数
# 挖了 2 * 2 四个坑
# 1 1
# 2 3
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow=T))
# 第一行占两个坑
hist(wt)
hist(mpg)
hist(disp)

# 也可使用widths、heights来指定大小
# 相对宽带可直接通过数值指定，绝对宽度，如可通过lcm()指定多少厘米
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow=T), widths=c(3, 1), heights=c(1, 2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)








