#week 5 classwork

#challenge part of week 4 assignment

surveys <- read.csv("data/raw_data/portal_data_joined.csv")

surveys_new <- surveys[1:60, c("species_id", "weight", "plot_type")]

surveys_challenge <- surveys_new[(surveys_new[,2]>150),]

#tidyverse homework

#load the package
library(tidyverse)

surveys2 <- read_csv("data/raw_data/portal_data_joined.csv")

surveys_tidy <- surveys2 %>% 
  select(species_id, hindfoot_length, year) %>% 
  filter(!is.na(hindfoot_length))#removing the NAs from hindfoot length

surveys_tidy <- surveys_tidy[-c(1:31338),]#only look at last 100 rows

surveys_challenge2 <- surveys_tidy %>%
  filter(year == 1997, species_id == "RM")

#Mutate Function

surveys <- read_csv("data/raw_data/portal_data_joined.csv")

#making new columns based off of columns in your data frame - g to kg

surveys_mut <- surveys %>% 
  mutate(weight_kg = weight/1000)

surveys_mut <- surveys %>% 
  mutate(weight_kg = weight/1000, weight_kg2 = weight_kg*2)

surveys_mut2 <- surveys %>% #remove NAs, species that are NL, and create a kg column at one time
  filter(!is.na(weight)) %>% 
  filter(species_id != "NL")
  mutate(weight_kg = weight / 1000)
  
unique(surveys_mut2$species_id)#check to see if that line of code worked

#challenge: Create a new data frame from the surveys data that meets the following criteria: contains only the species_id column and a new column called hindfoot_half containing values that are half the hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30.

surveys_hindfoot_half <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half)

#split apply combine: sometimes there is grouping we need to do, eg mean weight for sex

surveys_group <- surveys %>% 
  group_by(sex) %>% 
  summarise(mean_weight = mean(weight, na.rm = TRUE))#removed NAs a new way

surveys %>% 
  group_by(sex, species_id) %>% 
  summarise(mean_weight = mean(weight, na.rm = TRUE))#displayed a mini table of every species and mean weight

#calculate multiple things within a single summarize function, also interested in minimum weight
surveys %>% 
  group_by(sex, species_id) %>% 
  summarise(mean_weight = mean(weight, na.rm = TRUE), min(weight, na.rm = TRUE))

#what's the difference between summarize and mutate?
sum_surveys <- surveys %>% 
  group_by(sex, species_id) %>% 
  summarise(mean_weight = mean(weight, na.rm = TRUE), min(weight, na.rm = TRUE))#summarise makes a neat little table with 4 columns

mut_surveys <- surveys %>% 
  group_by(sex, species_id) %>% 
  mutate(mean_weight = mean(weight, na.rm = TRUE), min(weight, na.rm = TRUE))#mutate adds the columns to existing data frame

#you can summarise on multiple things
surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarise(min_weight = min(weight), 
            max_weight = max(weight)) %>% 
ungroup()#can prevent problems later encountered associated with grouping 

#joins: when I want to add data to an existing dataset, in this case tails into surveys

tail <- read_csv("data/raw_data/tail_length.csv")
tail

#are columns the same length?
summary(surveys$record_id)
summary(tail$record_id)

#they match up nicely, so we can join them
#join_function(first_data, second_data, by = column_to_join_by)

left_join(surveys, tail, by = "record_id")#autmatically sorts by record_id into a neat table

#let's make a dataset that only has NL species
NL_data <- surveys %>% 
  filter(species_id == "NL")
NL_data

#i want to join this to the tail data
left_join(NL_data, tail, by = "record_id")

#joining multiple columns
#join_function(first_data, second_data, by = c("year", "month", "day))
#search "jenny bryan joins tutorial", Chapter 15 join two tables, superhero publisher etc

#pivoting with tidyr
library(tidyr)
library(tidyverse)
surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarise(mean_weight = mean(weight))

str(surveys_mz)

#goal here is to have a column for every genus, values are mean weights
unique(surveys_mz$genus)#how many columns will we have?
n_distinct(surveys_mz$genus)
n_distinct(surveys_mz$plot_id)#how many rows will we have?

wide_survey <- surveys_mz %>% 
  pivot_wider(names_from = "genus", values_from = "mean_weight")

#from wide to long now, formatting to work with the data in R

wide_survey %>% 
  pivot_longer(cols = -plot_id, names_to = "genus", values_to = "mean weight")

surveys_mz
