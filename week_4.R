#week 4 classwork

#from last week:                                          |||||
#factors are a bit funky

sex <- factor(c("male", "female", "female", "male"))
class(sex)
typeof(sex)

levels(sex)

nlevels(sex)

#specify the order of the levels

sex <- factor(sex, levels = c("male", "female"))

sex

#making factors into characters

sex_ch <- as.character(sex)

#                                                     |||||

#challenge 1: change sex to M and F and reorder so F is first
levels(sex)

levels(sex)[1] <- "M"
levels(sex)[2] <- "F"

sex <- factor(sex, levels = c("F", "M"))
sex

levels(sex)[1]

#right answer:

levels(sex) <- c("M", "F")
levels(sex)

#reordering the levels

sex <- factor(sex, levels = c("F", "M"))
levels(sex)

#starting with data

surveys <- read.csv("data/raw_data/portal_data_joined.csv")
#this is a dataframe

class(surveys)

nrow(surveys)# number of rows
head(surveys)# first 6 rows
colnames(surveys)# names of all the columns
summary(surveys)# quick summary of the csv

#challenge: str(surveys) 

str(surveys)

#what is the class of surveys? data.frame
#How many rows and how many columns are there? 34786 rows, 13 columns
#How many species have been recorded? 40 levels

surveys$species_id <- as.character(surveys$species_id)
str(surveys)

#pulling out unique identifiers in a column

unique(surveys$species_id)
unique(surveys$species)

# the $ sign is for pulling out single columns in a data frame

#indexing and subsetting dataframes

#brackets have 2 dimensions for dataframe
#[row, column]

surveys[1,1]

surveys[1,6]

surveys[,3]#if there is a blank space, R thinks we want every row in the column

#first 3 elements of the 7th column

surveys[1:3, 7]

surveys[,7]

#all columns rows 1-6

surveys[1:6,]

#exclude some data from query

surveys[,-1]

#also call the columns by their names

surveys["species_id"]
surveys[1:6, "species_id"]

#challenge:  create a new data frame of the first 200 rows

surveys_200 <- surveys[200,]

nrow(surveys)

surveys[34786,]

tail(surveys)

nrows <- nrow(surveys)

surveys[nrows,]
#nrows fills in for the long number so we don't have to type it out each time

#getting the exact middle row of the data

surveys[nrows/2,]

surveys_head <- surveys[-c(7:nrows)]
surveys_head2 <- surveys[-c(7:nrows),]

#the comma is necessary to clarify we want rows, otherwise it assumes columns

#TIDYVERSE HUZZAH

#install.packages("tidyverse") how to install a package

#how to load a package
library(tidyverse)

surveys <- read_csv("data/raw_data/portal_data_joined.csv")

surveys

class(surveys)

#dplyer is an awesome package for manipulating data

#select and filter

#select is for columns, and filter is for rows

surveys_new <- select(surveys, plot_id, species_id, weight)
surveys_new

filter(surveys, plot_id == 3)

#let's talk about pipes

# I want all weights greater than 5 and only columns species_id, sex, and weight

surveys2 <- filter(surveys, weight > 5)
surveys_sml <- select(surveys2, species_id, sex, weight)

# a pipe looks like this %>% (shortcut = ctrl+shift+m)

survey_sml2 <- surveys %>% 
  filter(weight > 5) %>% 
  select(species_id, sex, weight)


