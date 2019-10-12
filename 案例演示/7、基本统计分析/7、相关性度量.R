# 相关性度量：衡量相关性强弱
# 可使用vcd包中的assocstats()函数，计算二维列联表的phi系数、列联表系数和Cramer'sV系数
# vcd也提供了一个kappa()函数，可计算混淆矩阵的Cohen's kappa值已经加权的kappa值
# 如：混淆矩阵可以表示两位评判者对于一系列对象进行分类所得到结果的一致程度

# 二维列联表的相关性度量
library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)

# 使用assocstats()函数，获得相关性度量
# 结果：较大值意味着有较强的相关性
assocstats(mytable)
