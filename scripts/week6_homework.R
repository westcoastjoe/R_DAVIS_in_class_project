#week 6 homework

library(tidyverse)

gapminder <- read_csv("data/raw_data/gapminder.csv")

cols(
country = col_character(),
year = col_double(),
pop = col_double(),
continent = col_character(),
lifeExp = col_double(),
gdpPercap = col_double()
   )

#Problem 1.
#First calculates mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)

gapminder <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_lifeExp = mean(lifeExp))

ggplot(data = gapminder, mapping = aes(x = year, y = mean_lifeExp,)) +
  geom_point(aes(x = year, y = mean_lifeExp, color = continent)) +
  geom_line(aes(x = year, y = mean_lifeExp, color = continent))
 

#Problem 2.
#Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + #helps to visualize data over a large range and reveal linear exponential functions in the data
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + #appears to calculate the best fit line for data trends
  theme_bw()


#  Challenge! Modify the above code to size the points in proportion to the population of the country. Hint: Are you translating data to a visual feature of the plot?
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() + #helps to visualize data over a large range and reveal linear exponential functions in the data
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + #appears to calculate the best fit line for data trends
  theme_bw()
  
#  Hint: There’s no cost to tinkering! Try some code out and see what happens with or without particular elements.

#Problem 3
#Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.
countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")

gapminder %>%
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue") +
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Country") + ylab("Life Expectancy")
