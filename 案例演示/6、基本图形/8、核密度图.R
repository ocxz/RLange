# 核密度估计：是用于估计随机变量概率密度函数得一种非参数方法
# 核密度是一种用来观测连续型变量分布得有效方法
# 绘制方法：plot(density(x))
# x：是一个数值型向量
# 由plot()函数或lines()函数绘制

# 示例：核密度图

# 设置图形分布：2 * 2
par(mfrow=c(2, 2))

# 得到核密度
d <- density(mtcars$mpg)

# 绘制简单得核密度图
plot(d)


# 增加标题
plot(d, main="Kernel Density of Miles Per Gallon")
# 填充核密度图
# polygon()函数会根据顶点x和y的坐标，绘制多边形
polygon(d, col="red", border="blue")
# 添加轴须图
rug(mtcars$mpg, col="brown")



