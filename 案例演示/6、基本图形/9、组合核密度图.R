# 组合核密度图
# 使用核密度比较组间差异
# 使用sm包中的sm.density.compare()函数可向图形叠加两组或更多的核密度图
# 使用格式：sm.density.compare(x, factor)
# factor：是一个分组因子

# 示例：可比较的核密度图

# 设置两倍线宽
par(lwd=2)
# 载入sm包
library(sm)

# 准备数据
attach(mtcars)
# 常见分组因子
cyl.f <- factor(cyl, levels=c(4, 6, 8), labels=c("4 cylinder", "6 cylinder", "8 cylinder"))

# 绘制密度图
sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")
# 添加标题
title(main="MPG Distribution by Car Cylinders")

# 通过鼠标添加图例
# 生成一个值为c(2, 3, 4)向量，图例填充的颜色
colfill <- c(2:(1+length(levels(cyl.f))))
legend(locator(1), levels(cyl.f), fill=colfill)
