# 当已有列联表，而需要原始数据时，可使用表转换扁平格式

# 通过table2flat将表转化为扁平格式
# 此函数可接受一个R中表格（任意行列数），并返回一个扁平格式的数据框
# 可使用该函数输入一个已发表的研究中的表格，以扁平格式保存到R中
table2flag <- function(mytable) {
  df <- as.data.frame(mytable)
  rows <- dim(df)[1]
  cols <- dim(df)[2]
  x <- NULL
  for (i in 1:rows) {
    for (j in 1:df$Freq[i]) {
      row <- df[i, c(1:(cols-1))]
      x <- rbind(x, row)
    }
  }
  row.names(x) <- c(1:dim(x)[1])
  return(x)
}

# 使用table2flat()函数，转换已发表的数据
treatment <- rep(c("Placebo", "Threated"), times=3)
improved <- rep(c("None", "Some", "Marked"), each=2)
Freq <- c(29, 13, 7, 17, 7, 21)

# 组装数据框
mytable <- as.data.frame(cbind(treatment, improved, Freq))
mytable

# 扁平格式处理
mydata <- table2flag(mytable)
head(mydata)




