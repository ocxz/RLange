# 通过women数据集提供的15个年龄在30~39间女性的身高和体重信息
# 解决通过身高来预测体重

# 代码：简单线性回归，解决身高-体重之间的关系

# 利用lm()函数，获得拟合模型
fit <- lm(weight ~ height, data=women)

# 利用summary()函数， 展示拟合模型详细的结果
# 其结果可以得到拟合模型：Weight = -87.52 + 3.45 * Height
# 其中Pr(>|t|)栏。可以看出回归系数3.45显著不为0（p<0.001)，表明身高每增高1英尺，体重预期增加3.45磅
# R平方项(R-squared) = 0.991，表明模型可解释为体重99.1%，它是实际和预测值之间的相关系数
# 残差标准误(Residual standard error) = 1.53，则是模型用身高预测体重的平均误差
# F统计量：检测所有预测变量预测响应量是否都在莫格几率水平之上，因为该模型为简单回归
#只有一个预测变量，因此此处F检验等同于身高回归系数的t检验

summary(fit)

# 获得women数据集中的体重信息
women$weight

# 利用fitted()函数，列出拟合模型的预测值
fitted(fit)

# 利用residuals()函数，列出拟合模型的残差值
residuals(fit)

# 利用plot() 画出用于评价该拟合模型的诊断图 
plot(women$height, women$height, xlab="Height(in inches)", ylab="Weight(in pounds)")

# 利用abline()函数，画出拟合模型图，添加到诊断图中进行比较
abline(fit)

