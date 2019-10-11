# 条形图：通过垂直或水平的条形，展示类别型变量的分布（频数）

# 简单的条形图
# 函数barplot(height)：height是一个向量或矩阵
# 如果height是一个向量：则它的值确定了各条形的高度，将其绘制成一幅垂直条形图
# 使用horiz = T 则会生成一幅水平条形图
# 也可使用mian参数，添加图形标题，xlab、ylab分别添加x轴和y轴标签

# 示例：绘制一项探索类风湿性关节炎新疗法研究结果(其数据框在vcd包中，需要下载)
# 加载vcd包
library(vcd)

# 使用table() 函数提取各单元的计数
counts <- table(Arthritis$Improved)
counts

# 绘制简单条形图
barplot(counts, main="Simple Bar Plot", xlab="Improvement", ylab="Frequency")

# 绘制水平条形图
barplot(counts, main="Horizontal Bar Plot", xlab="Frequency", ylab="Improvement", horiz=T)


# 如果绘制的类别型变量是一个因子或有序型因子，可直接使用函数plot() 快速创建一幅垂直条形图
# Arthritis$Imporved是一个因子，因此可直接使用plot()函数绘制
plot(Arthritis$Improved, main="Simple Bar Plot", xlab="Improved", ylab="Frequency")

# 使用plot绘制水平条形图
plot(Arthritis$Improved, horiz=T, main="Horizontal Bar Plot", xlab="Frequency", ylab="Improved")

