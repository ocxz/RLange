# 饼图在商业使用广泛，但统计学对其持否定状态
# 因为相对于面积，人们对长度的判断更为精确，故R中饼图的选项同其他统计软件相比十分有限
# 构建函数：pie(x, labels)
# x：是一个非负数值向量，表示每个扇形的面积
# labels：表示各扇形标签的字符型向量

# 示例：饼图
# 设置按行填充，2 * 2 四幅
par(mfrow=c(2, 2))
# 准备数据
slices <- c(10, 12, 4, 16, 8)
# 准备标签
labls <- c("US", "UK", "Australia", "Germany", "France")

# 画出饼图
pie(slices, labels=labls, main="Simple Pie Chart")

# 为饼图添加比例数值
pct <- round(slices/sum(slices)*100)
labls2 <- paste(labls, " ", pct, "%", sep="")

# 画出饼图
pie(slices, labels=labls2, col=rainbow(length(labls2)), main="Pie Chart With Percentages")

# 画出3D饼图
library(plotrix)
pie3D(slices, labels=labls, explode=0.1, main="3D Pie Chart")

# 从表格创建饼图
mytable <- table(state.region)
labls3 <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels=labls3, main="Pie Chart from a Table\n（with sample sizes")


# 扇形图(fan plot)：是饼图的变种，可展示相对数量和互相差异的方法
# 扇形图通过plotrix包中的fan.plot()函数来实现的
# 扇形的宽度是重要的，而半径并不重要
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
labls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels=labls, main="Fan Plot")







