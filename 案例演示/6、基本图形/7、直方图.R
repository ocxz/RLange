# 描述的是连续型变量的分布
# 通过X轴上，将值域分割为一定数量的组
# 在Y轴上显示相应值得频数，展示了连续型变量得分布
# 使用hist(x)函数绘制
# x：由数值组成得数值向量
# 参数：freq = FALSE 表示根据概率密度而非频数绘制
# 参数：breaks 用于控制组得数量
# 定义直方图中单元是，默认将生成等距切分

# 示例：直方图

# 设置图形布局 2 * 2 
par(mfrow=c(2, 2))

mtcars$mpg

# 画一个简单得直方图
hist(mtcars$mpg)

# 指定组数和颜色
hist(mtcars$mpg, breaks=12, col="red", xlab="Miles Per Gallon", 
     main="Colored histogram with 12 bins")

# 添加轴须图
hist(mtcars$mpg, freq=F, breaks=12, col="Green", xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve")

# 绘制轴须图（是实际数据值得一种一维呈现方式
# 若数据有许多结，可使用rug(jitter(mtcars$mpag, amount=0.01)) 向每个数据添加一个小得随机值
# 一个正负amount之间得均匀分布随机数，可避免重叠得点产生得影响
rug(jitter(mtcars$mpg))
# 叠加绘制一条密度曲线
lines(density(mtcars$mpg), col="blue", lwd=2)

# 添加正态密度曲线和外框
x <- mtcars$mpg
h <- hist(x, breaks=12, col="red", xlab="Miles Per Gallon",
          main="Histogram with normal curve and box")

xfit <- seq(min(x), max(x), length=40)
yfit <- dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit * diff(h$mids[1:2]) * length(x)
lines(xfit, yfit, col="blue", lwd=2)
box()
