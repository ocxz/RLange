# R中提供了许多用于整合（aggregate)和重塑数据的方法
# 数据整合：将多组观测数据替换为根据这些观测计算的描述性统计量，如统计总和
# 数据重塑：通过修改数据的结构（行列），来决定数据的组织方式

# 本次将使用mtcars数据框，该数据框描述了34种车型的设计和性能特点

# 转置：反转行列，是重塑数据集中最简单的方法之一
# 使用t() 即可对一个矩阵或数据框进行转置，后者行名和列名也会进行转换

# 示例：数据集的转置
cars <- mtcars[1:5, 1:4]
cars

# 对cars进行转置
t(cars)


# 整合数据
# 在R中使用一个或多个by变量和一个函数来折叠数据
# 调用格式：aggregate(x, by, FUN)
# x：待折叠的数据
# by：是一个变量名组成的列表，这些列表中的变量将被去掉，形成新的观测
# FUN：用来计算描述性统计量的变量函数，会被用来计算新观测中的值

# 整合数据示例：根据气缸数和档位数整合mtcars数据，并返回各个数值型变量的均值
options(digits=3)
attach(mtcars)
mtcars
aggdata <- aggregate(mtcars, by=list(cyl, gear), FUN=mean, na.rm=T)
aggdata
detach(mtcars)


















