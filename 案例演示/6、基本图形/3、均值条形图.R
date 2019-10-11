# 条形图不一定要基于计数数据或频率数据，可以使用数据整合函数并将结果传递给barplot()函数
# 创建表示均值、中位数、标准差等的条形图

# 示例：绘制排序后均值的条形图

# 数据准备
states <- data.frame(state.region, state.x77)
states

# 数据整合
means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)
means

# 排序
means <- means[order(means$x), ]
means

# 绘制条形图
barplot(means$x, names.arg=means$Group.1, col=c("red", "green", "yellow", "blue"))


# 添加标题
title("Mean Illiteracy Rate")
