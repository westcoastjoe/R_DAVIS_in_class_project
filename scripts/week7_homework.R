#week 7 homework assignment
library(ggplot2)
library(plotly)
library(tidyverse)

#filter out the population for 2002
africa_2002 <- read.csv("data/raw_data/gapminder.csv") %>% 
  filter(continent == "Africa" & year == 2002) %>% 
  group_by(country) %>%
  summarise(first_pop = pop) %>% 
  ungroup()
  
#filter out the population for 2007
africa_2007 <- read.csv("data/raw_data/gapminder.csv") %>% 
  filter(continent == "Africa" & year == 2007)%>% 
  group_by(country) %>%
  summarise(last_pop = pop) %>% 
  ungroup()

#join these data frames into one with the difference in population
africa_final <- left_join(africa_2002, africa_2007, by = "country") %>% 
  group_by(country) %>% 
  mutate(pop_chx = sum(last_pop - first_pop)) %>% 
  ggplot(mapping = aes(x = reorder(country, +pop_chx), y = pop_chx)) +
  geom_point()


africa_final

gapminder <- read_csv("data/raw_data/gapminder.csv")

#OK, this was a waste of time, because I could have done this all in one graph, then split them by country:
#filter out the population for 2002
continents_2002 <- read.csv("data/raw_data/gapminder.csv") %>% 
  filter(continent != "Oceania" & year == 2002) %>% 
  group_by(country, continent) %>%
  summarise(first_pop = pop) %>% 
  ungroup()

continents_2007 <- read.csv("data/raw_data/gapminder.csv") %>% 
  filter(continent != "Oceania" & year == 2007) %>% 
  group_by(country) %>%
  summarise(last_pop = pop) %>% 
  ungroup()

continents_final <- left_join(continents_2002, continents_2007, by = "country") %>% 
  group_by(country) %>% 
  mutate(pop_chx = sum(last_pop - first_pop)) 
  
  
  ggplot(data = continents_final, mapping = aes(x = reorder(country, +pop_chx), y = pop_chx)) +
  geom_col(mapping = aes(color = continent), show.legend = FALSE) +
  facet_wrap(~continent, scales = "free") +
  scale_y_continuous()+
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95, vjust = 0.99))+
  xlab("Country")+
    ylab("Change in Population Between 2002 and 2007")

  #ok this is the best I can do for now, I can't get the geom_bar to work for the bar graph. turned out I needed to use geom_col

  #this is how they did it.
  gapminder <- read_csv("data/raw_data/gapminder.csv")
  
  pg <- gapminder %>% 
    select(country, year, pop, continent) %>% 
    filter(year %in% c(2002, 2007)) %>% #or %in% 2002:2007, or just simply year > 2000 for this data set
    pivot_wider(names_from = year, values_from = pop) %>% 
    mutate(pop_growth_0207 = (`2007` - `2002`))#NOTE this is a backtick, not an apostrophe!!!!!!******

  pg %>% 
    filter(continent != "Oceania") %>% 
    ggplot(aes(x = reorder(country, pop_growth_0207), y = pop_growth_0207)) +
    geom_col(aes(fill = continent)) +
    facet_wrap(vars(continent), scales = "free") +
    theme_bw()+
    scale_fill_viridis_d() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1),
          legend.position = "none") +
    xlab("Country") +
    ylab("Yearly Pop Growth Between 2002 and 2007")
    

