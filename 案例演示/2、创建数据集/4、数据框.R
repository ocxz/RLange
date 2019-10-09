# 本质和矩阵有点类似
# 只要求每一列的数据类型相同，而不同列数据可以不同
# 构建：data.frame(col1, col2..., row.names = NULL, check.rows = FALSE,
#                   check.names = TRUE, fix.empty.names = TRUE,
#                   stringsAsFactors = default.stringsAsFactors()
#                 )
# col1 -> 第一列数据，是一个向量
# row.names -> 每一行的名字，默认1-总行数

# 创建一个数据框
# 第一列数据：
patientID <- c(1, 2, 3, 4)
# 第二列数据：
age <- c(25, 34, 28, 52)
# 第三列数据：
diabetes <- c("Type1", "Type2", "Type1", "Type1")
# 第四列数据：
status <- c("Poor", "Improved", "Excellent", "Poor")
# 可以指定行名称
rnames <- c("张三", "李四", "王五", "赵六")
# 构建patientdata数据框
patientdata <- data.frame(patientID, age, diabetes, status, row.names = rnames)
# 输出patientdata
patientdata

# 访问数据框中元素，与之前矩阵访问类似
# 访问1-2行
patientdata[1:2,]
# 访问1-2列，两种方式
patientdata[, 1:2]
patientdata[1:2]

# 根据名称访问，与索引访问方法一样
patientdata[c("patientID", "status")]

# 使用$来直接选取特定的变量
# 如生成糖尿病类型变量diabetes和病情变量status的列联表
table(patientdata$diabetes, patientdata$status)

# 使用attach() 将数据框添加到R的搜索路径中，如此可直接使用数据框列名来访问
attach(patientdata)
patientID
# 使用detach() 删除R搜索路径中的数据框
detach(patientdata)

# 使用with() 构建一个独立的运行环境，with内可直接使用列名访问数据框中数据
# 可使用 <<- 赋值全局变量，如此with外部也可访问使用 <<- 赋值的变量
with(patientdata, {
  s <<- summary(status)
  s
})
s







