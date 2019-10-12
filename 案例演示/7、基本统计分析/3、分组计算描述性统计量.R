# 比较多组个体或观测时，焦点经常是各组的描述性统计信息而非样本整体的描述性统计信息
# 首先我们以获取变速箱类型各水平的描述性统计量开始

# 使用aggregate()分组获取描述性统计量
# 如果使用by=list(mtcars$am) 则am列将被标注为Group.1而非am
# 若有多个分组，则可使用by=list(name1=group1, name2=group2,……)
vars <- c("mpg", "hp", "wt")
aggregate(mtcars[vars], by=list(am=mtcars$am), mean)
aggregate(mtcars[vars], by=list(am=mtcars$am), sd)

# aggregate()无法一次性统计若干个统计量，如此可借用by()函数完成
# 格式：by(data, INDICES, FUN)
# data：数据框或矩阵
# INDICES：是一个因子或因子组成的列表，定义了分组
# FUN：任意函数
# 使用by()分组计算描述性统计量
dstats <- function(x) (c(mean=mean(x), sd=sd(x)))
by(mtcars[vars], mtcars$am, dstats)



# 使用doBy和psych包，也提供了分组计算描述性统计量的函数，需要提前安装
# doBy包中summaryBy()函数的使用格式：
# summaryBy(formula, data,=dataframe, FUN=fuction)
# 其中formula格式：var1 + var2 + var3 + …… ~ group1 + gruop2 + ……
# ~左侧变量：需要分析的数值型变量
# ~右侧变量：类别型的分组变量
# 使用doBy包中的summaryBy()分组计算概述统计量
library(doBy)
summaryBy(mpg+hp+wt~am, data=mtcars, FUN=dstats)


# psych包中的descirbe.by()函数，可计算和describle相同的描述性统计量
# 只是按照一个或多个分组变量分层
# 使用psych包中的describe.by()函数，分组计算概述统计量
# 但这个方法被废弃了，不推荐使用
# 不允许指定任意函数，普适性比较低
# 若有多个分组变量，可使用list(group1, group2, ……)，仅在分组变量交叉后不出现空白单元时有效
library(psych)
describe.by(mtcars[vars], mtcars$am)




# 使用reshape包，灵活的按组导出描述性统计量
# 融合数据：dfm <- melt(dataframe, meaure.vars=y, id.vars=g) 融合数据
# dataframe：数据框
# y：一个向量，指名需要进行概述的数值型变量（默认所有变量）
# g：是由一个或多个分组变量组成的向量
# 重铸数据：cast(dfm, group1+group2+……+varible~ ., FUN)
# 分组变量：分组变量以+分隔
# varible：重铸后数据框的变量

# 运用数据重塑方法，获取由变速箱类型和气缸数形成的每个亚组的描述性统计量
# 我们要获取的描述性统计量是样本大小、平均数、标准差

# 示例：通过reshape包，进行分组计算概述统计量
library(reshape)
dstats <- function(x)(c(n=length(x), mean=mean(x), sd=sd(x)))
# 数据融合
# 融合mpg、hp、wt数据
# 根据am、cyl来进行数据分组
dfm <- melt(mtcars, measure.vars=c("mpg", "hp", "wt"), id.vars=c("am", "cyl"))

# 数据重铸
cast(dfm, am+cyl + variable ~ ., dstats)










