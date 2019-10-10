# 很大时候，需通过排列、叠加若干图形来创建单幅的、有意义的图形
# 如此，我们可使用图形参数fig-->c(x0,x1,y0,y1)

# 示例：在散点图上面添加两幅箱线图，来创建单幅的增强型图形
par(lty=1)
opar <- par(no.readonly=T)

# 设置fig排列
# 表示散点图横坐标占：0~0.8、纵坐标：0~0.8
par(fig=c(0, 0.8, 0, 0.8))
# 设置散点图
plot(mtcars$wt, mtcars$mpg, xlab="Miles Per Gallon", ylab="Car Weight")

# 在其上方添加箱线图
# 表示散点图横坐标占：0~0.8、纵坐标：0.5~1
# 添加一幅图到另一幅图上时，需要设定参数new=T
par(fig=c(0, 0.8, 0.5, 1), new=T)
boxplot(mtcars$wt, horizontal=T, axes=F)

# 在其右侧添加箱线图
# 表示散点图横坐标占：0.65~1、纵坐标：0~0.8
par(fig=c(0.65, 1, 0, 0.8), new=T)
boxplot(mtcars$mpg, axes=F)

# 添加文本标注
mtext("Enhanced Scatterplot", side=3, outer=T, line=-3)
par(opar)
