# 加载library(RODBC)
library(RODBC)
# 获取数据库连接，通过ODBC配置
conn <- odbcConnect("sqldsn", uid="sa", pwd="123456")
data <- sqlFetch(conn, "ClassInfo")
data
# 关闭数据库连接
close(conn)

