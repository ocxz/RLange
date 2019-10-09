# 矩阵创建的标准示例
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL)
# data -> 构建矩阵的向量
# nrow -> 矩阵的行，必须能被向量个数整除
# ncol -> 矩阵的列，可以省略
# byrow -> 是否从行开始渲染，默认从列开始
# dimnames -> 构建矩阵时，指定的行列名，通常为list(rownames, colnames)

# 创建两个向量，用来存储行列名
rnames <- c("r1", "r2", "r3", "r4", "r5")
cnames <- c("c1", "c2", "c3", "c4")
# 创建一个 5 * 4 的矩阵
y <- matrix(1:20, 5, 4, byrow = T, dimnames = list(rnames, cnames))

# 获取第二行数据
y[2, ]
# 获取第二列数据
y[, 2]
# 获取指定行，指定列数据
y[c(1,2), c(3,4)]
