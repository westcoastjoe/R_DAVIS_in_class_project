#trying a newer method that worked in the lab today, but i forgot to bring a copy home
#converting a pdf publication into a colorful wordcloud
library(tm)
library(SnowballC)
library(wordcloud2)
library(readtext)
library(tidyverse)

getwd()

wordbase <- readtext("data/raw_data/Patten_et_al-2020-Translational_Psychiatry.pdf")

wordbase[1, 2]

print(wordbase)

corp <- Corpus(VectorSource(wordbase))

corp <- tm_map(corp, PlainTextDocument)

corp <- tm_map(corp, removePunctuation)

corp <- tm_map(corp, removeNumbers)

corp <- tm_map(corp, tolower)

corp <- tm_map(corp, removeWords, stopwords(kind = "en"))


textCorpus <- 
  Corpus(VectorSource(corp)) %>%
  TermDocumentMatrix() %>%
  as.matrix()

###

#sort words ascending to descending
textCorpus <- sort(rowSums(textCorpus), decreasing=TRUE)

#create a dataframe with most used words
textCorpus <- data.frame(word = names(textCorpus), freq=textCorpus, row.names = NULL)

#filter out any words you don't want still appearing in the table 
textCorpus <- textCorpus %>% 
  filter(word != "–")

# build wordcloud 
wordcloud <- wordcloud2(data = textCorpus, minRotation = 0, maxRotation = 0, ellipticity = 0.6)

wordcloud


