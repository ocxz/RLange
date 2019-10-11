# 日期值通常以字符串的形式输入到R中，然后转化为数值形式存储的日期变量
# 可使用函数as.Date()进行转换
# as.Date()语法： as.Date(x, "input_format")
# x：是字符型数据
# %d：数字表示日期(0~31)    01 ~ 31
# %a：缩写的星期名          Mon
# %A：非缩写星期名          Monday
# %m：月份(00~12)           00~12
# %b：缩写的月份            Jan
# %B：非缩写的月份          January
# %y：两位数年份            07
# %Y：四位数年份            2017
# 日期默认输出格式为：yyyy-mm--dd

# Sys.Date() 可以返回当天的日期
# date() 可以返回当前的日期和时间
# format(x, format="output_format")  输出指定格式的日期值
# difftime(startdate, enddate, units=……) 来计算时间间隔，并以星期、天、时、分、秒来表示
# R内部存储日期是，是按照自1970/01/01 以来的天数表示的，更早的日期则表示为负数
# 所以日期格式，可以直接用于算术运算

# 字符串转日期格式
mydates <- as.Date(c("2007-06-22", "2004-02-13"))
class(mydates)

# 按照格式转换
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")
dates

# 使用Sys.Date() 返回当天日期
Sys.Date()

# 使用Date() 返回当前的日期和时间
date()

# 使用format() 函数 可以格式化日期
today <- Sys.Date()
format(today, format="%Y年%m月%d日 %A")
format(today, format="%A")

# R内部存储日期是，是按照自1970/01/01 以来的天数表示的，更早的日期则表示为负数
# 所有日期格式，可以直接用于算术运算
startdate <- as.Date("98/05/16", "%y/%m/%d")
enddate <- Sys.Date()
days <- enddate - startdate
days

# 也可使用difftime() 来计算时间间隔，并以星期、天、时、分、秒来表示
today <- Sys.Date()
dob <- as.Date("1998-05-16")

# 日期格式转换为字符型变量（不常用）
# 使用as.character() 可将日期值转换为字符型
strDates <- as.character(dob)
strDates
class(strDates)


