#welcome to week 7

#load survey data in
surveys_complete <- read_csv("data/raw_data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) #period means all columns

#we want to plot to count how many species id for each year
yearly_counts <- surveys_complete %>% 
  count(year, species_id)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line()
#This puts all the lines together

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line(aes(color = species_id))
#each species gets its own color

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) +
  geom_line() 
#each species has a different line but same color

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, linetype = species_id)) +
  geom_line() 
#changes the style of line for black and white

#faceting: grouping by a catgorical variable, in this case by species to create a mini graph for each species
ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id)
#created individual graphs by species_id

#Challenge 1
yearly_counts_sex <- surveys_complete %>% 
  count(year, species_id, sex)

ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n)) +
  geom_line(aes(color = sex)) + #when i color within geom_line, it is only visible to that callout. better to color in ggplot aes call
  facet_wrap(~ species_id)

ggplot(data = yearly_counts_sex, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() + 
  facet_wrap(~ species_id)

