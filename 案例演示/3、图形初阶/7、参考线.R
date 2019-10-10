# 可使用abline(h=, v=,) 来添加参考线
# abline() 也可指定图形参数

# 图例：帮我们辨别条线、扇形区域、条形所代表的数据
# 可使用legend() 来添加图例
# 格式：legend(location, title, legend, ……)
# location：图例位置  可使用locator(1)，然后通过鼠标给出图例位置
# 也可通过bottom、bottomleft、left、topleft、top、topright、right、bottomright、center放置
# title：图例标题字符串
# legend：图例标签组成的字符型向量
# bty：指定盒子样式
# bg：指定背景色
# cex：指定大小
# text.col：指定文本颜色
# horiz=T 水平放置图例

# 输入数据
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# 保存原来的图形参数设置
opar <- par(no.readonly=T)

# 增加线条、文本、符号、标签的宽度或大小
par(lwd=2, cex=1.5, font.lab=2)

# 绘制图形
plot(dose, drugA, type="b", pch=15, lty=1, col="red", ylim=c(0,60), main="药物A   VS   药物B",
      xlab="剂量", ylab="响应")

#  添加药物B对剂量响应的图形
lines(dose, drugB, type="b", pch=17, lty=2, col="blue")

# 添加参考线
abline(h=c(30), lwd=1.5, lty=2, col="gray")

# 添加次要刻度线，需要下载并加载Hmisc包
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)

# 添加图例
legend(locator(1), inset=0.05, title="药物类型", c("A", "B"), lty=c(1, 2),
       pch=c(15, 17), col=c("red", "blue"))

# 恢复原来设置
par(opar)








