# 名义型变量：即没有顺序或者类别之分的变量，变量之间没有关系
# 有序型变量：表示一种顺序，或者类别关系，同属于某一类，但非数量关系，如：合格、优、良
# 连续型变量：可以呈现为某个范围的任意值，同时表示了顺序和数量，通常为数值型
# 如：成绩：90， 95，75……  这些变量同属于成绩一类，且是数量
# 其中：名义型变量和有序性变量在R中称为因子
# 因子可以决定数据的分析方式和如何进行视觉呈现
# factor() 是以一个整数向量的形式来存储类别值

diabetes <- c("Type1", "Type2", "Type1", "Type1")
# 使用factor() 后，会将此向量存储为(1, 2, 1, 1)，底层会进行1->Type1、2->Type2的关联
diabetes <- factor(diabetes)
diabetes

# 有序型变量，则需要为其指定ordered = True
status <- c("Poor", "Imporved", "Excellent", "Poor")
# 存储时内部会根据字母AScii码进行关联：Excellent = 1  Imporved = 2   Poor = 3
# 如何指定ordered=TRUE，按照默认顺序进行排序
status <- factor(status, ordered=TRUE)
status
# 可以指定levels参数，覆盖默认排序
# 如此存储时，Poor = 1   Improved = 2   Excellent = 3
status <- factor(status, ordered = T, levels = c("Poor", "Improved", "Excellent"))
status

# 因子的使用案例
patientID <- 1:4
age <- c(25, 34, 28, 58)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Imporved", "Excellent", "Poor")
# 构建因子
diabetes <- factor(diabetes)
status <- factor(status, ordered = T)
# 构建数据框
patientdata <- data.frame(patientID, age, diabetes, status)
# 展示数据框，
patientdata
# 显示数据框对象结构
str(patientdata)
# 显示统计对象的统计概要
# 会区别对待各个变量，连续型变量显示：最大值、最小值、均值、各四分位数
# 类别型变量：显示各级别的频数值
summary(patientdata)













