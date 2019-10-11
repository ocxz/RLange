# 有多种方法对条形图进行微调
# 可以使用cex.names 来减小字号
# 可选参数names.arg 可以指定字符向量作为条形的标签

# 示例：为条形图搭配标签

# 添加y的边界大小
par(mar=c(5, 8, 4, 2))
# 旋转条形标签
par(las=2)

library(vcd)
counts <- table(Arthritis$Improved)

# 绘制条形图
barplot(counts, main="Treatment Outcome", horiz=T, cex.name=0.8, 
        names.arg=c("No Improvement", "Some Improvement", "Marked Improvement"))
