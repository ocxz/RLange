# 问题：
# 将学生的数学成绩、科学成绩、英语成绩综合成单一的成绩衡量指标
# 基于相对名字（前20%，下20%等）给出A到F的评分
# 根据学生姓氏的首字母对花名册进行排序

# 一种解决方案
# 设定参数digits = 2
options(digits=2)

# 学生名字
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose", "David Jones",
             "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak", "Greg Knox",
             "Joel England", "Mary Rayburn")
# 数学成绩
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)

# 科学成绩
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)

# English
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

# 构建数据框
roster <- data.frame(Student, Math, Science, English, stringsAsFactors=F)

# 计算综合得分
# 给成绩继续标准化处理
z <- scale(roster[, 2:4])
# 计算标准化后，个人平均标准成绩
score <- apply(z, 1, mean)
# 将标准化成绩，组合到数据框中
roster <- cbind(roster, score)


# 对学生进行平均
# 根据成绩后百分比进行分类，分位函数，分层4组 每组占20%
y <- quantile(score, c(0.8, 0.6, 0.4, 0.2))
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"


# 抽取姓氏和名字
# 将姓氏和名字分开，返回一个向量列表
name <- strsplit((roster$Student), " ")
# 使用sapply()函数，提取列表中每个成分第一个元素，放入姓氏向量中
# "[" 是一个可以提取某个对象一部分的函数，就算是是个函数，用来提取对象一部分
# 姓氏
firstname <- sapply(name, "[", 1)
# 名字
lastname <- sapply(name, "[", 2)
# 将姓氏和名字组合到数据集中
# 去掉第一个Studnet变量，在前面添加姓氏和名字进行替代
roster <- cbind(firstname, lastname, roster[, -1])

# 根据姓氏和名字排序
roster <- roster[order(lastname, firstname),]

# 显示数据
roster


