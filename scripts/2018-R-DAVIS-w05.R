# R-DAVIS 2018
# Week 05

# dplyr summarize and write to csv

library(tidyverse) # read in library

# bring data into R as an object
surveys <- read_csv("data/portal_data_joined.csv")


# remove NAs from data ----------------------------------------------------

surveys_complete <- surveys %>% 
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))


# Extract most common speciesID -------------------------------------------
# lets filter to most common species
species_counts <- surveys_complete %>% 
  group_by(species_id) %>% 
  tally %>%  # can use tally(), tally(.)
  filter(n >= 50)

# lets use that table (species_counts) to filter our surveys_complete  

surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_counts$species_id)
# went from 30676 to 30463 rows


# WRITE to CSV ------------------------------------------------------------


write_csv(x = surveys_complete, path = "data_output/surveys_complete.csv")


# starting from scratch; learning to plot! --------------------------------

# Load the packages that we will need
library(tidyverse)

surveys_complete <- read_csv("data_output/surveys_complete.csv")
glimpse(surveys_complete)

# Here is the ggplot syntax

# This will create the canvas! First argument in tidyverse functions
# is the data
ggplot(data = surveys_complete)

ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point()

# Make sure to add the plus sign at the END of a line, and not the start of the next line
# This will not put the geometry on the ggplot
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))
+ geom_point()

# Save the ggplot pieces as R objects (aka variables)
surveys_plot <- ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length))

surveys_plot + geom_point()

# Install the hexbin package
install.packages("hexbin")

library(hexbin)

# Modify the following code to fix the overplotting and produce a "hexbin" plot with a hexbin geometry
surveys_plot +
  geom_point()

surveys_plot +
  geom_hex()

# Continue the philosophy of building a plot iteratively
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)

# add some color to the plot
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "blue")


# Let's color the points *by species*
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

# List all the functions within a given package.
ls(package:hexbin)

# When we "map" data to an aesthetic (a visual feature of a plot) we use the aes() function. If we want to fix a visual feature of a plot (e.g., all points are blue), we don't need the aes() function.

# Where to put the aes() function call
# Version 1 (the first way we saw it)
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

# Version 2 
ggplot(data = surveys_complete, aes(x = weight, y = hindfoot_length, color = species_id)) +
  geom_point(alpha = 0.1)

# Version 3
ggplot(data = surveys_complete) +
  geom_point(aes(x = weight, y = hindfoot_length, color = species_id), alpha = 0.1)


# post-class review of how to search for function help --------------------


?log()

??hexbin

log(x = 1000, base = 10)
?summary


# post-class review of using functions that summarize data ----------------
# i.e., collapse a vector of numbers into a single number

my_vector <- c(1, 4, 6, 9)
my_vector
summary(my_vector)
?filter
?summarize

summarize(surveys_complete, mean_wgt = mean(weight))

surveys_complete %>% 
  group_by(sex) %>% 
  summarize(mean_wgt = mean(weight))






















































  
  
  
  
  
  
  








