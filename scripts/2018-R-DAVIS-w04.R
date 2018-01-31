# R-DAVIS 2018
# Week 04

# download data onto computer
download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")

# load tidyverse
library(tidyverse)

# bring data into R as an object
surveys <- read_csv("data/portal_data_joined.csv")


# USING FILTER ------------------------------------------------------------
# filter
filter(surveys, year==1995) # using dplyr
surveys[surveys$year==1995, ] # base R

# use filter and select
filter(surveys, year==1995 & weight > 5) %>% 
  select(species_id, year, weight)

# same thing as above but in Base R
filterA <- surveys[ surveys$year == 1995 & surveys$weight > 5, ] 
subsetB <- filterA[ , colnames(filterA) %in% c("species_id", "year", "weight")]
subsetB <- filterA[ , c("species_id", "year", "weight")]

# MUTATE ------------------------------------------------------------------

# let's add a column with the "mutate"
surveys %>% 
  mutate(weight_kg = weight/1000) # create a new column

mutate(surveys, 
       weight_kg=weight/1000) # this is the same as above

# need to assign to object
surveys2 <- surveys %>%
  mutate(weight_kg=weight/1000)

# chain mutate together
surveys2 <- surveys %>% 
  mutate(weight_kg = weight/1000,
         decimal_day = day/365,
         weight_lb = weight_kg * 2.2)

head(surveys2)

# working to filter out NAs
surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000) %>% 
  head   # note you don't need a parantheses here because we are piping

# pasting columns together
surveys %>% 
  filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000,
         date_example = paste(year, "-", month, "-", day,sep = "")) %>% 
  as.data.frame 
  

# CHALLENGE ---------------------------------------------------------------

surveys_new <- surveys %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  select(species_id, hindfoot_half) %>% 
  filter(!is.na(hindfoot_half) & hindfoot_half < 30)
dim(surveys_new)


# GROUP_BY ----------------------------------------------------------------

surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

surveys3 <- surveys %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

# filter out NAs first
surveys3 <- surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight))

# one way to view this without assigning it is with print
surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight)) %>% 
  print(n=80)





































