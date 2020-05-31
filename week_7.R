#welcome to week 7
library(tidyverse)

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
  facet_wrap(~ species_id) +
  theme_minimal()

#visualizations dos and don't
#intro to publishing plots with cowplot

library(cowplot)

plot_diamonds <- diamonds %>% 
  ggplot(aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))

plot_cars <- mtcars %>% 
  ggplot(aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 2) +
  theme_minimal()

plot_diamonds

plot_cars2 <- mpg %>% 
  ggplot(aes(x = cty, y = hwy, color = manufacturer)) +
  geom_point()

#now use cowplot to stitch them together
library(cowplot)
plot_grid(plot_cars, plot_diamonds, plot_cars2, labels = c("A", "B", "C"), ncol = 2, nrow = 2)

#plotly for interactive plots
library(plotly)


ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", aes(group = factor(cyl), color = factor(cyl)))#add factor to make it a variable rather than a continuous scale
#this is what happens without the factor designation, R thinks there are 5 and 7 cylinder engines too:
plot1_plots
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", aes(group = cyl, color = cyl))

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", aes(group = factor(cyl), color = factor(cyl)))+
  theme(axis.title.x = element_text(size = 25))
              