# 字符处理函数
# 用于从文本型数据中抽取信息、为打印输出和生成报告重设文本格式

# 1、计算字符数量：nchar(x)   计算x中的字符数量
# 2、计算个数：length(x)    通常可计算向量中元素的个数
# 3、提取字串：substr(x, start, stop)   如：substr(x, 2, 4)
# 4、替换字串：substr(x, start, stop) <- 替换的值  如：substr(x, 2, 4) <- "22"
# 5、搜索字串：grep(pattern, x, ignore.case=FALSE, fixed=FALSE)
            # pattern：正则表达式
            # x：需要搜索的数据
            # fixed=TRUE 表示pattern为一个文本字符串，即不采用正则
            # 返回值为匹配的下标
            # grep("A", c("b", "A", "c), fixed=TRUE)  返回值为2
# 6、正则替换：sub(pattern, replacement, x, ignore.CASE=FALSE, fixed=FALSE)
            # 如：sub("\\s", ".", "Hello There")  返回值为：Hello.There
# 7、分割字符串：strsplit(x, split, fixed=FALSE)
            # y <- strsplit("abc", "") 将返回一个包含'a'、'b'、'c‘三个元素的列表
# 8、paste(……, sep="") 连接字符串 sep表示分隔符，默认”“
            # 如：paste("x", 1:3, sep="") 返回值：c("x1", "x2", "x3")
# 9、字符大写：toupper(x)
# 10、字符小写：tolower(x)

# 注意：函数grep()、sub()和strsplit() 能够搜索某个文本字符串或正则表达式
# 其实正则表达式为文本匹配模式提供了一套完备的语法
# 如：^[hc]?at   可以匹配任何以0个或1个h|c开头的，后面接at的字符串
# 如可匹配到：hat、cat、at








