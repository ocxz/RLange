# 点图：提供了一种简单水平刻度上绘制大量有标签值得方法
# 点图创建：dotchart(x, labels=)
# x：是一个数值向量
# labels：由每个点得标签组成得向量
# 可通过groups参数来选定一个因子，用于指定x中元素得分组方式
# 如此，可使用gcolor参数来控制不同组标签得颜色
# cex：可控制标签得大小
# 一般点图在进过排序且分组变量被不同符合和颜色区分开得时候最有用

# 基本点图绘制示例
# 在同一水平轴上观测每种车型得每加仑汽油行驶英里数
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.7,
         main="Gas Mileage for Car Models", xlab="Miles Per Gallon")


# 分组、排序、着色后的点图
# 排序
x <- mtcars[order(mtcars$mpg),]

# 分组，转化为因子进行分组
x$cyl <- factor(x$cyl)

# 分组着色
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"

# 绘制点图
# gcolor="black"：指定分组标签即4、6、8的颜色为黑色
dotchart(x$mpg, labels=row.names(x), cex=0.7, groups=x$cyl, gcolor="black", color=x$color,
         pch=19, main="Gas Mileage for Car Models\ngrouped by cylinder",
         xlab="Miles Per Gallon")


