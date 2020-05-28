#welcome to week 6: visualizing using ggplot2

library(tidyverse)
library(dplyr)

#only return survey data containing no NA values for plot practice
surveys_complete <- read_csv("data/raw_data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

surveys_complete

#structure data well because ggplot2 will not be happy. it's like painting a canvas:
#what size graph do i need, what layers will i include?
#think of it as building up from your base

# basic ggplot building

# ggplot(data = DATA, mapping = aes(MAPPINGS)) + geom_function()

ggplot(data = surveys_complete)
#nice blank canvas!

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))
#now we get axes with limits built in

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +#has to be at the end
  geom_point()

#we can store whole plots or parts of plots as objects
# assigning part of a plot to an object

surveys_plot <- ggplot(data = surveys_complete,
                       mapping = aes(x = weight, y = hindfoot_length))

surveys_plot + geom_point()

ggplot() + geom_point(data = surveys_complete,
                       mapping = aes(x = weight,
                                     y = hindfoot_length))

#modify a specific geom by itself
#modify transparency of the points
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +  geom_point(alpha = 0.1)

#change color of points
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +  geom_point(alpha = 0.1, color = "blue")

#change colors to id species by color in the plot
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +  geom_point(alpha = 0.1, aes(color = species_id))

#challenge attempt
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) + geom_point(alpha = 0.1, aes(color = plot_type))

#what would be a better representation of these? Maybe separate plot types into 5 different box plots!

#make a box plot of weight on y axis and species_id on the x, spreading points with jitter
surveys_complete %>% 
  ggplot(mapping = aes(x = species_id, y = weight)) +
  geom_boxplot()+
  geom_jitter(alpha = 0.1, color = "tomato")

#we need to put the boxplots on top of the points for better visibility
surveys_complete %>% 
  ggplot(mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1, color = "tomato") +
  geom_boxplot()
  
