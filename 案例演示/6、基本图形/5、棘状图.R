# 棘状图：是对堆砌条形图进行了重缩放，使得每个条形的高度均为1，即每一段成比例
# 可由vcd包中的spine()绘制

library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spinogram Example")
detach(Arthritis)
