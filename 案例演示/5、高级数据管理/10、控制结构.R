# 默认执行顺序是，从上往下，依次执行的
# 有时需要选择|循环执行语句，此时就需要流程控制
# 几个概念：
# 1、语句(statement)：指一条单独的R语句或复合语句（包含在花括号{}中的一组R语句，使用分号分隔）
# 2、条件(cond)：是一条执行结果为真（TRUE)或假（FALSE)的表达式
# 3、表达式(expr)：示意图数值或字符串的求值语句
# 4、序列(seq)：是一个数值或字符串序列

# 循环结构
# 注意：涉及大数据集中行列处理时，循环结构可能比较低效、费时，尽可能联用R中的内建函数和
# apply族函数进行处理

# for 循环结构
# 语法：for (var in seq) statement
for (i in 1:10) print("Hello")

# while 循环结构
# 语法：while (cond) statement
i <- 10
while (i > 0) {
  print("World");
  i <- i - 1
}



# 条件分支结构
# 包括if-else、ifelse、switch

# if-else 结构
# 语法：if (cond) statement
# 语法2：if (cond) statement1 else statement2
if (T) print("Good")
if (T) print("Good") else print("Not Good")

# ifelse 结构  是if-else的精简版
# 语法：ifelse(cond, statement1, statement2)
score <- 0.75
ifelse(score > 0.5, print("Passed"), print("Failed"))
outcome <- ifelse(score > 0.5, "Passed", "Failed")
outcome


# switch 结构   根据表达式的值，选择语句执行
# 语法：switch(expr, ……)
feelings <- c("sad", "afraid")
for (i in feelings)
  print(
    switch (i,
      happy = "I am glay you are happy",
      afraid = "There is nothing to fear",
      sad = "Cheer up",
      angry = "Calm down now"
    )
  )











