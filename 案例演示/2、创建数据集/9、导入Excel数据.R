# 下载并按照RODBC包，已安装则无须执行此代码
install.packages("RODBC")
# 加载RODBC
library(RODBC)
# 获取于Excel的连接对象
conn <- odbcConnectExcel2007("F:/R语言/RData/2015年度中国城市GDP排名.xlsx")
# 从连接对象中，读取工作表Table 1
mydata <- sqlFetch(conn, "Table 1")
mydata
# 关闭连接
odbcClose(conn)


# 安装xlsx包，快速操作xlsx文件
# 注意：这个要求机器上装载了java，否则加载不了xlsx包
# 使用read.xlsx(file, n) 函数读取xlsx文件，n代表工作表序列号
install.packages("xlsx")
# 加载xlsx包
library(xlsx)
# 直接读取xlsx文件
mydata <- read.xlsx("F:/R语言/RData/2015年度中国城市GDP排名.xlsx", 1)
