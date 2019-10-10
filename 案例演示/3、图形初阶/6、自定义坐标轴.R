# 可以使用axis来自定义坐标轴，而不使用R中默认的坐标轴
# 函数格式：axis(side, at=, labels=, pos=, lty=, las=, tck=,……)
# 图形参数
# side -> 绘制图形边界，1=下 2=左 3=上 4=右
# at -> 数值型向量，表示需要绘制刻度线的位置(坐标轴数据)
# labels -> 字符型向量，刻度线旁边的文字标签，默认使用at中的值
# pos -> 坐标轴起点的值，如x轴与y轴的交点
# lty -> 线条类型
# col -> 线条和刻度线颜色
# las -> 标签是否平行于坐标轴（=0）或垂直于坐标轴（=2）
# tck：刻度线长度，负值表示图形外侧，正值表示图形内侧，0表示禁用刻度，1表示网格线，默认-0.01

# 构建数据
x <- 1:10
y <- x
z <- 10/x

# 保存原有图形参数设置
opar <- par(no.readonly = T)

dev.new()
# 添加边界大小
par(mar = c(5, 4, 4, 8) + 0.1)

# 绘制x对y的图形 
# yaxt="n"：不绘制y轴坐标
plot(x, y, type="b", pch=21, col="red", yaxt="n", lty=3, ann=F)

# 添加 x对 1/x的直线
lines(x, z, type="b", pch=22, col="blue", lty=2)

# 绘制自己的坐标轴，左坐标轴
axis(2, at=x, col.axis="red", las=2)

# 绘制右边坐标轴
axis(4, at=z, labels=round(z, digits=2), col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

# 添加标题和文本
mtext("y=1/x", side=4, line=3, cex.lab=1, las=2, col="blue")

# 添加标题
title("一个自定义坐标轴的栗子", xlab="x坐标轴", ylab="y坐标轴")

# 将参数设置还原
par(opar)











