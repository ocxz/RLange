# 计算好相关系数后，可使用一定方法，将其进行统计显著性检验
# 常用的原假设为：变量间不相关，即总体的相关系数为0
# 可使用cor.test()函数，对单个Pearson、Spearman、Kendall相关系数进行检验
# 简化格式：cor.test(x, y, alternative="two.side", method="Pearson")
# x、y：是为要检验相关性的变量
# alternative：是用来指定进行双侧检验或单侧检验（取值："two.side"、"less"、"greater"）
# 若研究的假设总体相关系数小于0，则应该使用：alternative="less"
# 大于0，则应该使用：alternative="greater"
# 默认：alternative="two.side"  总体相关系数不等于0
# method：用来指定要计算的相关类型（"pearson"、"kendall"、"spearman")

# 检验某种相关系数的显著性
# 数据准备
states <- state.x77[,1:6]
states
# 获得 文盲和谋杀率的Pearson相关系数
cor.test(states[, 3], states[, 5])

# cor.test()函数每次只能检验一种相关关系
# 可使用psych包中的corr.test()函数，依次计算多个

# 利用corr.test计算相关矩阵，并进行显著性检验
# use：取值为"pairwise"或"complete" 分别对缺失值执行成对删除或行删除
# method：取值可为"pearson"(默认值)、"spearman"、"kendall"
library(psych)
corr.test(states, use="complete")




# 其他显著性检验
# 在多元正态性的假设下，可使用ggm包中的pcor.test() 进行检验控制一个或多个额外变量时
# 两个变量之间的条件独立性
# 使用格式：pcor.test(r, q, n)
# r：是由pcor()函数计算得到的偏相关系数
# q：为要控制的变量数（以数值表示位置）
# n：为样本大小

# psych包中的r.test()函数，提供了多种实用的显著性检验方法，可检验：
# 某种相关系数的显著性
# 两个独立相关系数的差异是否显著
# 两个基于一个共享变量得到的非独立相关系数的差异是否显著
# 两个基于完全不同的变量得到的非独立相关系数的差异是否显著









