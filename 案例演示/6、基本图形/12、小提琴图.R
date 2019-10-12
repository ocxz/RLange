# 小提琴图(violin plot)：是箱线图的变种，它是箱线图和核密度图的结合
# 需要使用vioplot包中的vioplot()函数绘制
# 使用格式：vioplot(x1, x2, ……, names=, col=)
# x1，x2，……：表示要绘制的一个或多个数值向量（将为每一个向量绘制一幅小提琴图）
# names：是小提琴图中标签的字符向量
# col：是一个为每幅小提琴图指定颜色的向量
# vioplot()函数，要求将要绘制的不同组分离到不同变量中
# 图中：白点是中位数、黑色盒子是从下四位点到上四位点、细黑线表示须，外部形状为核密度估计

# 示例：小提琴图
library(vioplot)

# 准备数据
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]

# 绘制小提琴图
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8cyl"), col="gold")

# 添加标题
title("Violin Plots of Miles Per Gallon")
