# 箱线图可用来展示单个变量或分组变量
# 使用格式：boxplot(formula, data=dataframe)
# formula：是一个公式 如：y ~ A 指将为类别型变量A的每个值并列地生成数值型变量y地箱线图
# dataframe：表示提供数据的数据框（或列表）
# 增加参数varwidth=TRUE，可使得箱线图的宽度与其样本大小的平方根成正比
# 参数horizontal=TRUE，可反转坐标轴方向

# 使用并列箱线图，重新研究四缸、六缸、八缸发动机对每加仑汽油行驶英里数的影响

# 绘制并列箱线图
boxplot(mpg~cyl, data=mtcars, main="Car Milleage Data"
        , xlab="Number of Cylinders", ylab="Miles Per Gallon")

# 可添加notch=TRUE，获得含凹槽的箱线图
# 若两个箱的凹槽互相不重叠，则表明其中位数有显著差异
# 绘制凹槽并列箱线图
boxplot(mpg~cyl, data=mtcars, notch=T, varwidth=T, col="red",
        main="Car Mileage Data", xlab="Number of Cylinders", ylab="Miles Per Gallon")


# 两个交叉因子的箱线图
# 创建气缸数量因子
mtcars$cyl.f <- factor(mtcars$cyl, levels=c(4, 6, 8), labels=c("4", "6", "8"))
# 创建变速箱类型因子
mtcars$am.f <- factor(mtcars$am, levels=c(0, 1), labels=c("auto", "standard"))

# 生成箱线图
boxplot(mpg~am.f * cyl.f, data=mtcars, varwidth=T, col=c("gold", "darkgreen"),
        main="MPG Distribution by Auto Type", xlab="Auto Type")



