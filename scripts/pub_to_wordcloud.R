#open toolboxes that will be needed
library(rtweet)        # Used for extracting the tweets
library(tm)            # Text mining cleaning
library(stringr)       # Removing characters
library(qdapRegex)     # Removing URLs 
library(wordcloud2)
library(RColorBrewer)

#copy and paste text of interest into a text document and save where R can see it

pub = "data/raw_data/KP_pub.txt" #replace this file with text file location

#tell R to make a table of the text
pub_txt = readLines(pub)

# Clean the data
clean_pub <- 
  pub_txt %>%
  str_remove("\\n") %>%                   # remove linebreaks
  str_remove_all("#\\S+") %>%             # Remove any hashtags
  str_remove_all("@\\S+") %>%
  str_remove_all(".\\S+") %>%
  str_remove_all(",\\S+") %>%
  str_remove_all("'\\S+") %>%# Remove any @ mentions
  removeWords(stopwords("english")) %>%   # Remove common words (a, the, it etc.)
  removeNumbers() %>%
  stripWhitespace() %>%
  removeWords(c("amp"))
  # Final cleanup of other small changes

# Convert the data into a summary table
corp <- 
  Corpus(VectorSource(clean_pub)) %>%
  TermDocumentMatrix() %>%
  as.matrix()

###

#sort words ascending to descending
textCorpus <- sort(rowSums(textCorpus), decreasing=TRUE)

#create a dataframe with most used words
textCorpus <- data.frame(word = names(textCorpus), freq=textCorpus, row.names = NULL)

# build wordcloud 
wordcloud <- wordcloud2(data = textCorpus, minRotation = 0, maxRotation = 0, ellipticity = 0.6)

#see wordcloud
wordcloud


#trying a new way: https://www.ryananddebi.com/2017/07/21/r-linux-creating-a-wordcloud-from-pdf/

library(tm)
library(SnowballC)
library(wordcloud)
library(readtext)

getwd()
setwd("data/raw_data/")
wordbase <- readtext("Patten_et_al-2020-Translational_Psychiatry.pdf")

print(wordbase)
wordbase[1, 2]
corp <- Corpus(VectorSource(wordbase))

corp <- tm_map(corp, PlainTextDocument)

corp <- tm_map(corp, removePunctuation)

corp <- tm_map(corp, removeNumbers)

corp <- tm_map(corp, tolower)

corp <- tm_map(corp, removeWords, stopwords(kind = "en"))

color <- brewer.pal(8,"Spectral")

png("38516.png", width=1280,height=800)

wordcloud(corp, max.words = 1000, min.freq=5, random.order = FALSE, colors = color, scale=c(8, .3))

dev.off()

wordcloud(corp, max.words = 1000, min.freq=5, random.order = FALSE, colors = color, scale=c(8, .3))
