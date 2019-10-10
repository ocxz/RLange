# 第一步：构建空数据框或者矩阵用于存储数据，需要指定变量和变量类型
# 类似于 age=numeric(0) 是指创建一个指定模式、单不包含实际数据的变量
mydata <- data.frame(age=numeric(0), gender=character(0), weight=numeric(0))
# 第二步：使用edit()，调用文本编辑器，进行数据填充
mydata <- edit(mydata)
# 继续填充，然后关闭编辑器即可
mydata
