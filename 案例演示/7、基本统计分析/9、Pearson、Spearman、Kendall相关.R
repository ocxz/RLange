# 相关系数：可用来描述定量、变量之间的关系
# 可使用正负号表明关系的方向（正相关、负相关）
# 其值的大小表示关系的强弱程度（完全不相关为0，完全相关时为1）

# 使用数据集：state.x77数据集
# 提供了：美国50个州的1977年的人口、收入、文盲率、预期寿命、谋杀率、高中毕业率

# 相关的类型：R可以计算多种相关系数
# 包括Pearson相关系数、Spearman相关系数、Kendall相关系数、偏相关系系数
# 多分格(polychoric)相关系数、多系列(polyserial)相关系数


# Pearson、Spearman、Kendall相关
# Pearson积差相关系数：衡量了两个定量变量之间的线性相关程度
# Spearson等级相关系数：衡量了分级定序变量之间的相关程度
# Kendall'Tau相关系数：是一种非参数的等级相关度量

# 使用cor()函数，可计算这三种相关系数，cov()函数可用于计算协方差
# 与相关系数的计算方法格式：cor(x, use="everything", method="pearson")
# x：矩阵或数据框
# use：指定缺失数据的处理方式，可选方式：all.obs(遇到缺失数据报错)、complete.obs(行删除)、
# everything(遇到缺失数据时，计算结果为missing)、pairwise.complete.obs(成对删除)
# method：指定相关系数的类型，可选类型为pearson、spearman或kendall

# 代码：协方差和相关系数
states <- state.x77[,1:6]

# 计算协方差
cov(states)

# 获得pearson积差相关系数
cor(states)

# 获得spearman等级相关系数
cor(states, method="spearman")

# 默认情况得到的结果是一个方阵（所有变量之间两两计算相关），也可计算非方形的相关矩阵
x <- states[, c("Population", "Income", "Illiteracy", "HS Grad")]
y <- states[, c("Life Exp", "Murder")]
cor(x, y)




