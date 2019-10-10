# 输入数据
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# 设置图形参数
# 保留当前图形参数
opar <- par(no.readonly = T)

# 设置参数
# 设置图形尺寸（英寸） 宽5 高4
par(pin = c(5, 4))
# 线宽：默认2倍   缩放倍数：1.5倍
par(lwd=2, cex=1.5)
# 坐标轴缩放比例：0.75   坐标轴字体样式：3
par(cex.axis=.75, font.axis=3)

# 画出药物A对剂量的响应
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
# 画出药物A对剂量的响应
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")

# 恢复默认参数
par(opar)
