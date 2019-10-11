# 自定义函数，R中的许多函数都是由已有函数构成的
# 函数结构的大致：
# myfunction <- function(arg1, arg2, ……) { statements return(object) }
# 注意：函数中的对象只在其内部有效，返回对象的数据类型也是任意的

# 示例：写一个函数用于计算数据对象的集中趋势和散布情况
# 参数：可选择性的给出参数统计量（均值和标准差）及非参数统计量（中位数和绝对中位差）
# 返回值：一个含名称列表的姓氏，此外用户可指定是否自动输出结果，默认不输出

# 一个由用户编写的描述性统计量计算函数
# parametric：指定计算均值和标准差 还是 计算中位数和绝对中位差
# print：指定是否打印结构
mystats <- function(x, parametric=T, print=F) {
  
  ifelse(parametric, {center <- mean(x); spread <- sd(x)}
         , {center <- median(x); spread <- mad(x)})
  
  if (print & parametric) {
    # cat使用来连接对象的，将结果输出控制台|文件
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  
  result <- list(center=center, spread=spread)
  return (result)
}

# 随机生成一批数据，服从正态分布，大小位500的随机样本
set.seed(1234)
x <- rnorm(500)

# 测试函数
y <- mystats(x, print=T)
y <- mystats(x, parametric=F, print=T)



# 使用switch 结构编写一个函数
# 此函数可选择输入日期格式，输出当前的日期
mydate <- function(type="long") {
  switch(type,
    long = format(Sys.time(), "%A %B %d %Y"),
    short = format(Sys.time(), "%m-%d-%y"),
    cat(type, "is not a recognized type\n")   # 默认执行语句
  )
}

# 测试函数
mydate("long")
mydate("short")
mydate("medium")








