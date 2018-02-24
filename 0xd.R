#소스 설치 헤
#install.packages("rJava")
#install.packages("memoise")
#install.packages("KoNLP")
#install.packages("wordcloud")
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre-9.0.4/")
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
library(dplyr)
library(ggplot2)
#useNIADic()
txt <- readLines("0xd.txt")
wordcount <- table(unlist(txt))
hehe <- as.data.frame(wordcount, stringsAsFactors = F)
hehe <- rename(hehe,word = Var1,freq = Freq)
hehe <- filter(hehe, nchar(word) >= 2)
top20 <- hehe %>%
  arrange(desc(freq)) %>%
  head(20)
#pal <-brewer.pal(8,"Dark2")
#set.seed(1234)
#wordcloud(words= hehe$word,
#          freq = hehe$freq,
#          min.freq = 2,
#          max.word = 50,
#          random.order = F,
#          rot.per = .1,
#          scale = c(3,0.3),
#          colors = pal)
name=top20$word
freq=top20$freq
ggplot(data =top20,aes(x=reorder(name,-freq),y=freq))+geom_col()
