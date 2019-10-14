# 利用多项式作为自变量，来提供回归的预测精度
# 如可使用：fit2 <- lm(weight ~ height + I(height^2), data=women)
# 其中I(height^2)：表示向预测等式添加一个身高平方项，I函数将括号内容看做R的一个常规表达式

# 多项式回归，拟合二次项等式，得到身高-体重关系式
fit <- lm(weight ~ height + I(height^2), data=women)

# 通过summary()函数，获取拟合模型的详细信息
# 其结果是：Weight = 261.88 - 7.34 * Height + 0.08 * Height^2
# R的平方项，即方差解释率增加到了99.95%，p < 0.001
# t = 13.891, p < 0.001 表明包含二次项提高了模型的拟合度
summary(fit)

# 利用plot()函数，画出实际身高-体重点图
plot(women$height, women$weight, xlab="Height(in inches)", ylab="Weight(in pounds)")

# 利用lines()函数，画出拟合模型图
# 实际体重：women$height
# 对应的预测身高：fitted(fit)
lines(women$height, fitted(fit))


# 线性模型和非线性模型
# 多项式等式仍可认为是线性回归模型，它依然是预测变量加权和的形式（本例是身高和身高的平方）
# 如模型：Yi = B0 + B1*logX1 + B2*sinX2 仍可认为是线性模型（参数项是线性的）
# 可用Y ~ log(X1) + sin(X2) 进行拟合
# 相反，例子：Yi = B0 + B1*e^(x/B2) 是真正的非线性模型，可用nls()函数进行拟合
# 一般来说，n次多项式生成一个n-1个弯曲的曲线
# 如：拟合三次多项式可用：fit <- lm(weight ~ height + I(height^2) + I(height^3), data=women)

# 使用car包中的scatterplot()函数，绘制二元关系图
# 例子如下：
# 包含了身高-体重散点图
# 直线为线性拟合图
# 虚线为曲线平滑拟合
# 边界为箱线图
# spread=F选项，删除了残差正负均方根在平滑曲线上的展开和非对称关系
# lty.smooth=2，设置loess拟合曲线为虚线
# pch=19 设置点位实心圆，默认为空心圆
library(car)
scatterplot(weight ~ height, data=women, spread=F, lty.smooth=2, pch=19,
            main="Women Age 30-39", xlab="Height(inches", ylab="Weight(labs.)")
