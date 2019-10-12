# R提供了多种检验类别型变量独立性的方法
# 包括：卡方独立性检验、Fisher精确检验、COchran-Mantel-Haenszel检验

# 卡方独立性检验
# 使用chisq.test()函数，对二维表行变量和列变量进行卡方独立性检验
# 检验代码如下：
library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
# 使用卡方检测mytable的接受治疗和改善水平的独立性
# p < 0.01 表示存在着某种关系
chisq.test(mytable)

# 检测改善情况和性别的关系
# p > 0.05 表示性别和改善情况之间不存在关系
mytable <- xtabs(~Improved+Sex, data=Arthritis)
chisq.test(mytable)


# Fisher精确检验
# 可使用fisher.test()函数进行Fisher精确检验
# Fisher原假设：边界固定的列联表中行列是相互独立的
# 调用格式：fisher.test(mytable)，mytable是一个二维列联表
# fisher.test()函数可以使用在任意行列式大于等于2的二维列联表，而不能使用 2* 2 的列联表
# 示例：
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
# 使用Fisher精确检验
fisher.test(mytable)



# Cochran-Mantel-Haenszel检验
# 可使用mantelhaen.test()函数进行Cochran-Mantel-Haenszel卡方检验
# 原假设：两个名义变量在第三个变量的每一层中都是独立条件的

# 检验治疗情况和改善情况在性别的每一个水平下是否独立
# 假设不存在三阶交互作用，即：治疗情况 * 改善情况 * 性别
mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
# 进行Cochran-Mantel-Haenszel卡方检验
# 结果表明患者接受的治疗与得到的改善在性别的每一水平下并不独立
# 即：分性别来看，用药治疗的患者交接受安慰剂的患者有了更多的改善
mantelhaen.test(mytable)





