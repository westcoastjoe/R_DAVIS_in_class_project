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

#challenge:  

