# 保存图形
# 保存为pdf()、png()、jpeg()……
png("F:/R语言/案例演示/3、图形初阶/mypng.png")

# 加载mtcars数据库
attach(mtcars)
# 根据wt(x坐标) mpg(y坐标) 画出散点图
plot(wt, mpg)
# 添加一条最优拟合曲线
abline(lm(mpg~wt))
# 给散点图添加标题
title("Regression of MPG On Weight")
# 解绑数据库
detach(mtcars)

# 关闭输出
dev.off()

# 打开一个新的窗口
dev.new()
# 加载mtcars数据库
attach(mtcars)
# 根据wt(x坐标) mpg(y坐标) 画出散点图
plot(wt, mpg)
# 添加一条最优拟合曲线
abline(lm(mpg~wt))
# 给散点图添加标题
title("Regression of MPG On Weight")
# 解绑数据库
detach(mtcars)

