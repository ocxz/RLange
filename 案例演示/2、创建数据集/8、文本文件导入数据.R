# 可使用read.table() 从带有分隔符的文本文件中导入数据
# 此函数可读入一个表格格式文件，将其保存为一个数据框
# 基本函数read.table(file, header=TRUR, sep="", row.names=null)
# file -> 文本文件的路径
# header -> 第一行数据是否为变量名
# sep -> 分隔符，默认为空格，即“ “ 表示一个或多个空格，制表符，换行符。即回车符
# row.names -> 是一个可选参数，用于指定一个或多个行标识符

# 读取分隔符为空格的txt文件
# 文件中，被#注释的会被忽略
data <- read.table("F:/R语言/RData/input 1.txt", header =T, sep=" ", stringAsFactors=F)
data

# 读取csv文件，它的分隔符是逗号
data <- read.table("F:/R语言/RData/input.csv", header=T, sep= ",", stringAsFactors=F)
data
