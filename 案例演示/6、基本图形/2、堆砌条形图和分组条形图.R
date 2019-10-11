# 如果height是一个矩阵，而不是一个向量，则绘制结果将是一幅堆砌条形图或分组条形图
# 若beside为默认值FALSE，则矩阵中每一列都将生成图中的一个条形,各列中的值将会是堆砌的子条高度
# 若beside为TRUE，则矩阵中的每一列都表示一个分组，各列中的值将并列而非堆砌

# 考虑治疗类型和改善情况联表
library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)

# 绘制堆砌条形图
barplot(counts, main="Stacked Bar Plot", xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"), legend=rownames(counts))


# 绘制分组条形图
barplot(counts, main="Grouped Bar Plot", xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"), legend=rownames(counts), beside=T)
