# 若两组数据独立，则可使用Wilcoxon秩和检验，也叫Mann-Whitney U检验
# 用来评估观测是否从相同的概率分布中抽得的（即，在一个总体中获得更高分的概率是否比另一个总体大）
# 调用格式：wilcox.test(y ~ x, data)  y：数值型变量   x：二分变量
# 调用格式或为：wilcox.test(y1, y2)
# y1、y2：为各组的结果变量
# 可选参数data的取值：为一个包含了这些变量的矩阵或数据框
# 默认进行一个双侧检验，可添加参数exact来进行精确检验
# alternative="less"或alternative="grreater"进行有方向的检验

# 使用Mann-Whitney U 检验，检测监禁率问题
library(MASS)
with(UScrime, by(Prob, So, median))

# 调用wilcox.test()函数
wilcox.test(Prob~So, data=UScrime)


# Wilconxon符合秩检验：是非独立样本t检验的一种非参数代替方法
# 适用于两组成对数据和无法保证正态性假设的情景，与Mann-Whitney U检验调用格式相同
# 但可添加参数paired=TRUE

# 使用案例，解答两组年龄与失业率关系
# 求两组数据中位数
sapply(UScrime[c("U1", "U2")], median)

# 使用Wilconxon符合秩检验
with(UScrime, wilcox.test(U1, U2, paired=T))



