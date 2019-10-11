# 除了字符数据转换为日期格式外，R中提供了一系列用于判断l类型和类型转换函数
# 函数简介  前为判断    后为转换
#       is.numberic()    as.numeric()        数值型
#       is.character()   as.character()      字符型
#       is.vector()      as.vector()         向量型
#       is.matrix()      as.matrix()         矩阵
#       is.data.frame()  as.data.frame()     数据框
#       is.factor()      as.factor()         因子
#       is.logical()     as.logical()        逻辑型


# 类型转换案例
a <- c(1, 2, 3)
a
is.numeric(a)
is.vector(a)

a <- as.character(a)
a
is.numeric(a)
is.character(a)
is.vector(a)
