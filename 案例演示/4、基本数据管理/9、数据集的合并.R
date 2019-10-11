# 若数据分散在多个地方，则需要将其合并成需要的数据
# 横向合并数据框：使用merge()函数
# 多数情况，两个数据框是通过一个或多个共有变量进行连结的，即内联结inner join
# 例如：total <- merge(dataframeA, dataframeB, by="ID)
# 又例如：total <- merge(dataframeA, dataframeB, by=c("ID", "Country"))
# 横向联结通常用于向数据框中添加变量
# 如果要直接横向合并两个矩阵或数据框而不指定公共索引，则可直接使用cbind()函数
# total <- cbind(A, B), 要求每个对象必须拥有相同的行数且以相同顺序排序

# 添加行
# 若想纵向合并两个数据框，可使用rbind()函数
# 要求：两个数据框必须拥有相同的变量，但顺序可以不同
# rbind(dataframeA, dataframeB)
# 若dataframeA中拥有dataframeB中没有的变量，可进行一些处理之一
# 1、删除dataframeA中的多余变量
# 2、在dataframeB中创建追加没有的变量。并将其值设为NA
# 纵向联结通常用于向数据框中添加观测/记录 