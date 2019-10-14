# car包提供了大量函数，可大大增强对拟合和评价回归模型的能力
# car包中的回归诊断实用方法
# 1、qqPlot()    分位数比较图
# 2、durbinWatsonTest()    对误差自相关性做Durbin-Watson检验
# 3、crPlots()       成分与残差图
# 4、ncvTest()       对非恒定的误差方差做得分检验
# 5、spreadLevelPlot()      分散水平检验
# 6、outlierTest()        Bonferroni离群点检验
# 7、avPlots()            添加的变量图形
# 8、inluencePlot()       回归影响图
# 9、scatterplot()        增强散点图
# 10、vif()               方差膨胀因子

# 注意：car包的2.x版本较1.x版本作了许多改变，包括函数名字、用法，咱们主要基于2.x版本

# 正态性
# 与基础包中的plot()函数相比，qqPlot()函数提供了更为精确的正态假设检验方法
# 画出了在n-p-1个自由度的t分布下的学生化残差值，也称之为学生化删除残差或折叠化残差图形
# 其中n是样本大小，p是回归参数数目(包括截距项)
# 示例代码如下：
# id.method= "identity" 选项能交互式绘图，待图形绘制后，可用鼠标单击图形内的点，标注函数label
# 的设定值，使用Esc键，从图形菜单中选择Stop或图形右击，关闭交互模式
# simulate=T时，95%的置信区间都会用参数自助法生成
library(car)
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
qqPlot(fit, labels=row.names(states), id.method="identify", simulate=T, main="Q-Q Plot")

# 处理Nevada，所有的点离直线都很近，且落在置信区间内，表明正态性假设符合很好
# 但是Nevada，有一个很大的正残差值（真是值-预测值）表明模型低估了该州的谋杀率
# 实际值
states["Nevada",]
# 获得预测值
fitted(fit)["Nevada"]
# 获得残差值
residuals(fit)["Nevada"]
# 
rstudent(fit)["Nevada"]



# 可视化误差的其他方法
# residplot()函数，将生成学生化残差柱状图（即直方图），并添加正态曲线、核密度曲线和轴须图
# 示例：绘制学生化残差图的函数
residplot <- function(fit, nbreaks=10) {
  z <- rstudent(fit)
  hist(z, breaks=nbreaks, freq=F, xlab="Studentized Residual", main="Distribution of Errors")
  rug(jitter(z), col="brown")
  curve(dnorm(x, mean=mean(z), sd=sd(z)),add=T, col="blue", lwd=2)
  lines(density(z)$x, density(z)$y, col="red", lwd=2, lty=2)
  legend("topright", legend=c("Normal Curve", "Kernel Density Curve"), lty=1:2,
         col=c("blue","red"),cex=0.7)
}

residplot(fit)
