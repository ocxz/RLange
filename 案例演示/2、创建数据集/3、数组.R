# 与矩阵类似，但维度可大于2
# 通过areray函数创建
# 创建形式：array(data = NA, dim = length(data), dimnames = NULL)
# data -> 构建数组的数据，数值型向量
# dim -> 维度，可以一个向量表示
# dimnames -> 各个维度的名称，是一个列表

# 构建一个 2 * 3 * 4 的三维数组
# 构建三个维度的名称
dim1 <- c("a1", "a2")
dim2 <- c("b1", "b2", "b3")
dim3 <- c("c1", "c2", "c3", "c4")
# 构建带有维度名称的三维 2 * 3 * 4的数组
z <- array(1:24, c(2, 3, 4), list(dim1, dim2, dim3))
# 输出z
z
