# 模拟研究和蒙特卡洛方法中，需要获取来自给的均值向量和协方差阵的多元正态分布数据
# 可以使用MASS包中的mvrnorm()函数
# 调用格式：mvrnorm(n, mean, sigma)
# n：想要得到样本的大小
# mean：为均值向量
# sigma：是方差-协方差矩阵（或相关矩阵）

# 生成服从多元正态分布的数据

# 加载MASS包
library(MASS)

# 设置参数digits = 3
options(digits=3)
# 设定随机种子
set.seed(1234)

# 指定均值向量、协方差矩阵
mean <- c(230.7, 146.7, 3.6)
sigma <- matrix(c(15360.8, 6721.2, -47.1, 6721.2, 4700.9, -16.5, -47.1, -16.5, 0.3), nrow=3)

# 生成数据
mydata <- mvrnorm(500, mean, sigma)
# 生成数据集
mydata <- as.data.frame(mydata)
# 给数据集指定变量名
names(mydata) <- c("y", "x1", "x2")

# 查看维度
dim(mydata)
# 查看前10条数据
head(mydata, n=10)
