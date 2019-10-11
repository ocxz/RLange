# 概率函数通常用于生成特征已知的模拟数据，及计算概率值
# dpqr
# d：密度函数（density)
# p：分布函数（distribution)
# q：分位数函数（quantile)
# r：生成随机数（随机偏差）

# 常用概率函数
# 1、Beta分布：beta
# 2、二项分布：binom
# 3、柯西分布：cauchy
# 4、非中心卡方分布：chisq
# 5、指数分布：exp
# 6、F分布：f
# 7、Gammma分布：gamma
# 8、几何分布：geom
# 9、超几何分布：hyper
# 10、对数正态分布：lnorm
# 11、Logistic分布：logis
# 12、多项分布：multinom
# 13、负二项分布：nbinom
# 14、正态分布：norm
# 15、泊松分布：pois
# 16、Wilcoxon符号秩分布：signrank
# 17、t分布：t
# 18、均匀分布：unif
# 19、Weibull分布：weibull
# 20、Wilcoxon秩和分布：wilcox

# 不指定均值和标准差，默认为标准正态分布（均值为0，标准差为1）
# 正态分布函数
x <- pretty(c(-3, 3), 30)
# 求y的密度函数值
y <- dnorm(x)
# 画图
# type = "l" 表示以line来绘制
plot(x, y, type="l", xlab="NormalDeviate", ylab="Density", yaxs="i")

# 求pnorm(1.96)
pnorm(1.96)
# 求qnorm(0.9)
qnorm(0.9, mean=500, sd=100)
# 求rnorm(50, mean=50, sd=10)
rnorm(50, mean=50, sd=10)
