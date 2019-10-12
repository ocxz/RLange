# 类别型变量的频数表和列联表、独立性检验、相关性度量、图形化展示

# 使用数据：vcd包中的Arthritis数据集
# 观测风湿性关节炎新疗法的双盲临床实验结果
# 包括：治疗情况（安慰及治疗、用药治疗）、性别、改善情况（无、一定改善、显著改善）

# 显示前几个观测
library(vcd)
head(Arthritis)


# 生成频数表方法
# 1、table(var1, var2, ……, varN)  使用N个类别型变量（因子）创建一个N维列联表
# 2、xtabs(formula, data)  根据公式和矩阵|数据框 来创建一个N维列联表
# 3、prop.table(table, margins)  依margins定义的编辑列表 将表中条目表示维分数形式（比例）
# 4、margin.table(table, margins)  依margins定义的边际列表 计算表中条目总和
# 5、addmargins(table, margins)  将概述边margins(默认是求和结果) 放入表中
# 6、ftable(table)  创建一个紧凑的平铺式列联表

# 一维列联表
# 使用table()函数生成简单的频数统计表
mytable <- with(Arthritis, table(Improved))
mytable

# 使用prop.table() 将频数转化为比例值
prop.table(mytable)


# 二维列联表
# table()函数构建二维列联表：mydata <- table(A, B)
# A：行变量
# B：列变量
# xtabs()函数还可使用公式风格，输入创建列联表
# mytable <- xtabs(~A + B, data=mydata)
# mydata：一个矩阵或数据框
# 要进行分叉分类的变量放在公式右侧（~右侧）、以+为分隔符
# 写在公式左侧的变量，则其为一个频数向量(在数据已经表格化时很有用)

# 类如：
mytable <- xtabs(~ Treatment + Improved, data=Arthritis)
mytable

# 可使用margin.table() 和prop.table()分别生成边际频数和比例
margin.table(mytable, 1)
prop.table(mytable, 1)

# 行列比例还可以这样，此时下标中的2指代table()语句的第二个变量
margin.table(mytable, 2)
prop.table(mytable, 2)

# 各个单元所占比例获取
prop.table(mytable)


# 使用addmargins()函数，为表格添加边际和
# 默认行为：为表中所有变量创建边际和
addmargins(mytable)
addmargins(prop.table(mytable))

# 仅添加了各行的和
addmargins(prop.table(mytable, 1), 2)

# 仅添加了各列的和
addmargins(prop.table(mytable, 2), 1)

# 注意：table()函数。默认忽略缺失值（NA) 
#若要在频数统计中将NA作为一个有效类别，可设定参数useNA = "ifany"


# 使用gmodels包中的CrossTable()函数，创建二维连列表
# CrossTable()函数有许多选项
# 计算（行、列、单元格）的百分比，指定小数位数，进行卡方，Fisher和McNemar独立性检验
# 计算期望和（皮尔逊、标准化、调整的标准化）残差
# 将缺失值作为一种有效值，进行行和列标题的标注，生成SAS或SPSS风格输出
# 使用方法参考：
library(gmodels)
CrossTable(Arthritis$Treatment, Arthritis$Improved)



# 多维列联表
# table()和xtabs()都可基于三个以上类别型变量生成多维列联表
# margin.talbe()、prop.table()和addmargins()函数可自然推广使用到三维以上
# ftable()函数可以一种紧凑而吸引人的方式输出多维列联表

# 示例：三维列联表
# 各单元格的频数
mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
mytable
# 使用ftable() 输出mytable
ftable(mytable)

# 边际频数 Treatment
margin.table(mytable, 1)
# 边际频数 Sex
margin.table(mytable, 2)
# 边际频数 Improved
margin.table(mytable, 3)

# （1）治疗情况Treatment * （3）改善情况（Improved)的边际频数
margin.table(mytable, c(1, 3))


# 治疗情况(Treatment) * 性别（Sex) 的各类改善情况比例
ftable(prop.table(mytable, c(1, 2)))

# 增加边际和
ftable(addmargins(prop.table(mytable, c(1, 2)), 3)) * 100




