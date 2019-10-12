# 使用summary()函数，计算描述性统计量
# summary() 函数提供了最小值、最大值、四分位数、均值、以及因子向量和逻辑型向量的频数统计
vars <- c("mpg", "hp", "wt")
summary(mtcars[vars])

# sapply()函数：计算所选择的任意描述性统计量
# 使用格式sapply(x, FUN, options)
# x：数据框或矩阵
# FUN：任意一个函数，包括mean、sd(标准差)、var(方差)、min、max、median、length、range、quantile
# 函数fivenum() 可返回图基五数总括（最小值、下四分位数、中位数、上四分位数和最大值）
# 若指定了options，则会传递给FUN函数
# 基础按照并没有提供偏度和峰度的计算函数，需要时可自行添加

# 通过sapply() 计算描述性统计量
mystats <- function(x, na.omit=F) {
  if (na.omit) {
    x <- x[!is.na(x)]
  }
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3) / n
  kurt <- sum((x-m)^4/s^4) / n -3
  return (c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

# 使用sapply()函数
sapply(mtcars[vars], mystats)


# 使用Hmisc包中的descirbe()函数，返回变量、观测数量、缺失值、唯一值数目、平均值、分位数
# 和五个最大值、五个最小值
# 通过Hmisc包中的describe()函数计算描述性统计量
library(Hmisc)
describe(mtcars[vars])


# 使用pastecs包中stat.desc()函数，计算种类繁多的描述性统计量
# 使用格式：stat.desc(x, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)
# x：是一个数据框或时间序列
# basic：默认值为TRUE，会计算其中所有值、空值、缺失值的数量、最大值、最小值、值域、总和
# desc：默认值为TRUE，则会计算中位数、平均数、平均数的标准误差、平均数置信度为95%的置信区间
# 以及方差、标准差、变异系数
# norm：默认值为FALSE，若为TRUE则会返回正态分布统计量，包括偏度、峰度、以及它们的统计显著程度
# 以及Shapiro-Wilk正态检验结果
# 它使用了p值来计算平均数的置信区间（默认置信度为0.95）

# 通过pastecs包中的stat.desc()函数来计算描述性统计量
library(pastecs)
stat.desc(mtcars[vars])



# 使用psych包中的describe()函数，计算非缺失值的数量、平均数、标准差、中位数、
#截尾均值、绝对中位差、最小值、最大值、值域、偏度、峰值、平均值的标准误差

# 通过psycha包中的describe()计算描述性统计量
library(psych)
describe(mtcars[vars])

