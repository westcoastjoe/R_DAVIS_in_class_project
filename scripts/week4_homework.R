#week 4 homework

#Basic R homework question
surveys <- read.csv("data/raw_data/portal_data_joined.csv")

#Create a new data frame called surveys_base with only the species_id, the weight, and the plot_type columns.
surveys_base <- surveys[1:60, c("species_id", "weight", "plot_type")]

#Convert both species_id and plot_type to characters. 
surveys_base$species_id <- as.character(surveys_base$species_id)
surveys_base$plot_type <- as.character(surveys_base$plot_type)
str(surveys_base)

#Remove all rows with weight == NA.
surveys_base_noNA <- surveys_base[complete.cases(surveys_base), ]

#Create a second data frame called challenge_base that only consists of individuals from your surveys_base 
#data frame with weights greater than 150g.
challenge_base <- surveys_base_noNA[(surveys_base_noNA[,2]>150),]

#tidyverse homework question
surveys2 <- read_csv("data/raw_data/portal_data_joined.csv")

#Create a new data frame called surveys_tidy with only the species_id, hindfoot_length, and the year columns.
#Remove all rows with hindfoot_length == NA. 
surveys_tidy <- surveys2 %>% 
  select(species_id, hindfoot_length, year) %>% 
  filter(!is.na(hindfoot_length))

#Next, select only the last 100 rows. 
surveys_tidy <- surveys_tidy[-c(1:31338),]

#CHALLENGE! Create a second data frame called challenge_tidy that only consists of the species “RM” in the year 1997.
challenge_tidy <- surveys_tidy %>% 
  filter(year == 1997) %>% 
  filter(species_id == "RM")
