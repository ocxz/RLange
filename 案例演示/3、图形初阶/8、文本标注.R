# 我们可以通过函数text()、mtext()将文本添加到图形
# text()可向绘图区域内部添加文本
# mtext()可向四大边界之一添加文本
# text的使用：text(location, "文本", pos=, ……)
# mtext的使用：mtext("文本”, side=, line=n， ……)
# pos：文本相对于位置方位，1=下 2=左 3=上 4=右
# side：指定要来放置文本的边
# cex：调整字号
# col：调整颜色
# font：调整字体样式

attach(mtcars)
plot(wt, mpg, main="车重对车美加仑汽油行驶英里数的影响", xlab="车重", ylab="英里数", pch=18, col="blue")

# 添加文本
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")

detach(mtcars)


# 第二个案例
opar <- par(no.readonly=T)
par(cex=1.75)
plot(1:7, 1:7, type="n")
text(3, 3, "一个对文本标注的栗子")
text(4, 4, family="mono", "mono字体的栗子")
text(5, 5, family="serif", "serif字体的栗子")
par(opar)














