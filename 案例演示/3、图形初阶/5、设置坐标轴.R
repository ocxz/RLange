# 许多高级绘图函数，如：plot、hist、boxplot  允许自行设定坐标轴及文本标注选项

# 输入数据
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)

# 画图
# 添加标题main、副标题sub、坐标轴标签xlab、ylab、指定坐标轴范围xlim、ylim
dev.new()
plot(dose, drugA, type="b", col="red", lty=2, pch=2, lwd=2, main="药物A对剂量的响应",
     sub="药物A对剂量的响应", xlab="剂量", ylab="响应", xlim=c(0, 60), ylim = c(0, 70))


# 单独设置标题
dev.new()
plot(dose, drugA, type="b", col="red", lty=2, pch=2, lwd=2, xlim=c(0, 60), ylim = c(0, 70),
     xlab = "剂量", ylab="响应", col.lab="green", cex.lab=0.75)
title(main="药物A对剂量的响应~~", col.main = "red")
title(sub = "药物A对剂量的响应~~", col.sub = "blue")
