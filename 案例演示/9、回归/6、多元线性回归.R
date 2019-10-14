# 当预测量不止一个时，简单线性回归就变成了多元线性回归
# 本质上多项式回归可用算作时多元线性回归的特例，二次回归有两个预测变量（X和X^2)
# 三次回归有三个预测变量（X、X^2和X^3)

# 以state.x77数据集为例，研究州犯罪率和其他因素的关系，包括人口、文盲率、平均收入、结霜天数
# 因为lm()函数，需要一个数据框(state.x77数据集是一个矩阵)，因此需要做转换
states <- as.data.frame(state.x77[,c("Murder", "Population", "Illiteracy", "Income", "Frost")])
states

# 多元回归分析，第一步最好可以做变量间的相关性
# 是由cor()函数，获得二变量之间的相关系数，car包中的scatterplotMatrix()函数，可生成散点图矩阵

# 检测二变量关系
# 获得二变量相关系数
cor(states)

# 画出其散点图矩阵
# 非对角线区域：绘制变量间的散点图，添加平滑（loess)和线性拟合曲线
# 对角线区域：绘制每个变量的密度图和轴须图
library(car)
scatterplotMatrix(states, spread=F, lty.smooth=2, main="Scatter Plot Matrix")


# 多元线性回归，解决犯罪率同 人口、文盲率、收入、结霜天数之间关系
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
# 获得拟合模型的详细参数
summary(fit)

# 回归系数含义：是指一个预测变量增加一个单位，而其他预测变量不变时，因变量增加的数量
# 如本例中得到结果：文盲的回归系数4.14，表示控制人口、收入、温度不变
# 文盲率上升1%，谋杀率上升4.14%，系数p<0.001
# 而Frost的系数没有显著为0（p=0.954)，表明当控制其他变量不变时，Frost与Murder不呈线性关系
# 总体来说，这些变量综合起来，解释了各州谋杀率56.7%的方差





