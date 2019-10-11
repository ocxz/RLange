# reshape包，是一套重构和整合数据集的工具
# 需要提前安装和加载改包
# 使用：先将数据进行融合(melt)，以使每一行都是一个唯一标识符-变量的组合
# 然后将数据重铸(cast) 为想要的任何形状，在重铸过程中，可以使用任何函数对
# 数据进行整合


# 融合：数据集的融合是将其重构为，每一个测量变量独占一行
# 行中带有要唯一确定该测量所需要的标识符变量

# 准备数据
ID <- c(1, 1, 2 ,2)
Time <- c(1, 2, 1, 2)
X1 <- c(5, 3, 6, 2)
X2 <- c(6, 5, 1, 4)
mydata <- data.frame(ID, Time, X1, X2, stringsAsFactors=F)

# 加载reshape包
library(reshape)

# 融合数据，标识符为ID和Time，测量为X1，X2
md <- melt(mydata, id=c("ID", "Time"))


# 重铸 
# cast() 函数读取已融合的数据，使用提供的公式和一个（可选的）用于整合数据的函数将其重铸
# 调用格式：newdata <- case(md, formula, FUN)
# md：已经融合的数据
# formula：描述想要的最后结果
# FUN：可选，数据整合函数
# 其接受公式形如：rowvar1 + rowvar2 + …… ~colvar1 + colvar2 + ……
# 其中：rowvar1 + rowvar2 + …… 定义了要划掉的变量集合，以确定各行的内容，也就是标识变量
# colvar1 + colvar2 + …… 则定义了要划掉的，确定各列内容的变量集合，是测量

# 不执行整合，将融合的数据还原
# 意思是：根据ID和Time来作为标识符，以variable的值作为测量变量，以value作为值
# ID=1 var=Time --> var
cast(md, ID+Time~variable)

# 执行整合
# 以ID和variable作为标识符，以Time作为测量，以Value做为值
# ID=1 var=X1 --> time
cast(md, ID+variable~Time)

# 以Id作为标识符，以variable和Time作为测量，以Value作为值
# ID=1 --> var+Time
cast(md, ID~variable+Time)

# ID=1 --> var 将其中求平均 
cast(md, ID~variable, mean)

# Time=1 --> var 求平均
cast(md, Time~variable, mean)

# Id = 1 --> Time 求平均
cast(md, ID~Time, mean)










