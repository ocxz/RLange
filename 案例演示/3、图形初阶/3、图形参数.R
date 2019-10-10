# 我们可以自定义图形参数，自定义一幅图像多个特征（字体、颜色、坐标轴、标题）
# 第一种方法：通过par()来指定，如此在整个会话中都有效
# 调用格式 par(name = value ……)
# 直接使用par()则可生成当前图形参数设置列表
# 添加no.readonly = TRUE  则可生成可修改的当前图形参数列表

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# 生成可修改的图形参数列表，即赋值当前图形参数设置
opar <- par(no.readonly = T)

# 设置图形显示参数
# lty = 2 -> 将线条类型修改为虚线
# pch = 17 -> 将点符号改成实心三角
par(lty=2, pch=17)
# 画出图形
plot(dose, drugA, type="b")
title("药物A对剂量的响应")

# 将opar设置为当前图形显示参数
par(opar)

# 第二种方式，在画图的时候直接指定参数，仅对当前图形有效
plot(dose, drugB, type="b", lty=2, pch=17, lwd=1.2, cex=2, col=rainbow(10))
title("药物B对剂量的响应")

# 颜色参数设置
n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels = mycolors, col=mycolors)
mygrays <- gray(0:n/n)
pie(rep(1, n), labels = mygrays, col=mygrays)


