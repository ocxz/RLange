# 显示当前选项
options()
# 设置 小数后保留3为有效数字
options(digits = 3)
# 创建20个随机分布的变量
x <- runif(20)
# 生成次数据的简要
summary(x)
# 画出直方图
hist(x)
# 保持历史记录
savehistory()
# 保持工作空间
save.image()
# 会话结束
q()
