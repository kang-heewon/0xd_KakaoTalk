#소스 설치 헤
#install.packages("rJava")
#install.packages("memoise")
#install.packages("KoNLP")
#Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre-9.0.4/")
#library(KoNLP)
#library(dplyr)
#useNIADic()
txt <- readLines("0xd.txt")
wordcount <- table(unlist(txt))
hehe <- as.data.frame(wordcount, stringsAsFactors = F)
hehe <- rename(hehe,word = Var1,freq = Freq)
hehe <- filter(hehe, nchar(word) >= 2)
top20 <- hehe %>%
  arrange(desc(freq)) %>%
  head(20)
head(top20)