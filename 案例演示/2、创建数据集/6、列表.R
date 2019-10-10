# 列表：R语言类型最为复杂的一种
# 是一些对象的有序集合，可整合若干可能无关的对象到单个对象名下
# 可以是向量、矩阵、数据框、及其它列表的组合，使用list() 创建列表

# 创建一个列表
g <- "My First list"
h <- c(25, 26, 18, 39, 36)
j <- matrix(1:10, nrow = 5)
k <- factor(c("one", "two", "three", "one", "three"), ordered = T)
l <- data.frame(h, j, k)
mylist <- list(title=g, ages=h, j, k, l)
mylist

# 访问列表元素
# 单方括号-> 返回一个列表，包含指定元素
 mylist[1]
# 使用双重方括号-> 直接指定列表中的元素，返回该元素
 mylist[[1]]
 