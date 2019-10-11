# 出来使用R语句操作数据外，我们还可以使用SQL语句操作数据
# 需要安装并加载”sqldf"包

# 加载sqldf包
library(sqldf)
# 使用sqldf() 函数执行select 语句
# 参数row.names = T， 将原始数据框中的名字延续到新的数据框中
newdf <- sqldf("select * from mtcars where carb=1 order by mpg", row.names=T)
newdf

newdf <- sqldf("select avg(mpg) as avg_mpg, avg(disp) as avg_disp, 
               gear from mtcars where cyl in (4, 6) group by gear
               ")
newdf
