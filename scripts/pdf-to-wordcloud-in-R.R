install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud2")
install.packages("readtext")
install.packages("tidyverse")

library(tm)
library(SnowballC)
library(wordcloud2)
library(readtext)
library(tidyverse)

getwd()

wordbase <- readtext("1-s2.0-S0969996119300737-main.pdf")

wordbase[1, 2]

corp <- Corpus(VectorSource(wordbase))

corp <- tm_map(corp, PlainTextDocument)

corp <- tm_map(corp, removePunctuation)

corp <- tm_map(corp, removeNumbers)

corp <- tm_map(corp, tolower)

corp <- tm_map(corp, removeWords, stopwords(kind = "en"))

corp <- tm_map(corp, removeWords, "-")

textCorpus <- 
  Corpus(VectorSource(corp)) %>%
  TermDocumentMatrix() %>%
  as.matrix()

textCorpus <- sort(rowSums(textCorpus), decreasing=TRUE)
textCorpus <- data.frame(word = names(textCorpus), freq=textCorpus, row.names = NULL)

wordcloud <- wordcloud2(data = textCorpus, minRotation = 0, maxRotation = 0, ellipticity = 0.6)
wordcloud


