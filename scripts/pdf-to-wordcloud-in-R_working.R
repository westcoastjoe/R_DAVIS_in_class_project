library(tm)
library(SnowballC)
library(wordcloud2)
library(readtext)
library(tidyverse)
library(webshot)
library(tidyverse)
library(htmlwidgets)
getwd()

# use setwd() to change this if needed

#read in the pdf:
wordbase <- readtext("data/raw_data/Patten_et_al-2020-Translational_Psychiatry.pdf")

wordbase[1, 2]

#clean up the document:
corp <- Corpus(VectorSource(wordbase))

corp <- tm_map(corp, PlainTextDocument)

corp <- tm_map(corp, removePunctuation)

corp <- tm_map(corp, removeNumbers)

corp <- tm_map(corp, tolower)

corp <- tm_map(corp, removeWords, stopwords(kind = "en"))

corp <- tm_map(corp, removeWords, "-")

#create a document matrix:
textCorpus <- 
  Corpus(VectorSource(corp)) %>%
  TermDocumentMatrix() %>%
  as.matrix()

#order in descending:
textCorpus <- sort(rowSums(textCorpus), decreasing=TRUE)
textCorpus <- data.frame(word = names(textCorpus), freq=textCorpus, row.names = NULL)

#remove unwanted characters:

textCorpus <- textCorpus %>% 
  filter(freq != "80")

#create wordcloud  
wordcloud <- wordcloud2(data = textCorpus, minRotation = 0, maxRotation = 0, ellipticity = 0.6)

wordcloud


#trying to get high def outputs now: not working yet
bmp("Plot7.tiff", height = 2000, width = 2000, res=300)
wordcloud
dev.off()
par(mfrow = c(1,1))


tiff("Plot3.tiff", width = 4, height = 4, units = 'in', res = 300)
wordcloud # Make plot
dev.off()
