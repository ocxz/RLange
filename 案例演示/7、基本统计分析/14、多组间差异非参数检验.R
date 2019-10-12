# 若要比较多组是，须使用其他方法
# 问题：如果根据state.x77数据集，比较美国四个地区(东北部、南部、中北部、西部)的文盲率
# 这个问题称之为单向设计，可使用参数或非参数的方法解决
# 若无法满足ANOVA设计的假设，则可使用非参数方法来评估组间差异
# 若各组独立，则可使用Kruskal-Wallis校验
# 若各组不独立（如重复测量设计或随机区组设计）则可使用Friedman检验
# Kruskal-Wallis检验调用格式：kruskal.test(y ~ A, data)
# y：是一个数值型结果变量
# A：是一个拥有两个或更多水平的分组变量（grouping variable)，如为两个，则于Mann-Whitney U 等价

# Friedman检验调用格式：friedman.test(y ~ A | B, data)
# y：是数值型结果变量
# A：是一个分组变量
# B：是一个用来认定匹配观测的区组变量(blocking variable)

# 以上两个，data均为可选参数，指定了包含这些变量的矩阵或数据框


# 使用Kruskal-Wallis检验 解决地区-文盲率问题
# 将地区名添加到数据集中，这些信息包含在state.region数据集中
states <- as.data.frame(cbind(state.region, state.x77))
states

# 进行检验
# Illiteracy：文盲率   state.region：四个地区
# p < 0.001 表明地区和文盲率具有相关性
kruskal.test(Illiteracy ~ state.region, data=states)




# 这个检验，无法告诉我们哪些地区显著的与其他地区不同
# 若要解决此问题，则可使用Man-Whiteney U 检测，每次比较两组数据
# 或者是在控制第一类错误概率的前提，执行可同步多组比较，如此则可一次性完成所有组间成对比较
# npmc包提供了所需要的非参数多组比较程序
# 接受输入为一个两列的数据框，其中一列名为var(因变量)、另一列名为class(分组变量)

# 使用案例：
# 准备分组变量数据
class <- state.region
# 准备因变量
var <- state.x77[, c("Illiteracy")]
# 组合数据框
mydata <- as.data.frame(cbind(class, var))
# 内存中清掉class和var
rm(class, var)

library(npmc)
# 成对组间比较
summary(npmc(mydata), type="BF")

# 各类别文盲率中间值
aggregate(mydata, by=list(mydata$class), median)



