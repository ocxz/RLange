# 求10名出生1年内的孩子体重数据
# 年龄
age <- c(1, 3, 5, 2, 11, 9, 3, 9,  12, 3)
# 体重情况
weight <- c(4.4, 5.3, 7.2, 5.2, 8.5, 7.3, 6.0, 10.4, 10.2, 6.1)
#求平均体重
mean(weight)
# 标准差
sd(weight)
# 计算age和体重的相关度
cor(age, weight)
# 画出散点图
plot(age, weight)
