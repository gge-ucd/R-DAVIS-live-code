# R-DAVIS 2018
# Week 03

# R can be used as a calculator
12 + 3

# The results of computation can be assigned to an object
temp <- 12 + 3

# this object can be called
temp

weight_kg <- 55

weight_kg <- c(55, 53, 62, 71)
weight_kg

# vectors can hold character strings
animals <- c("mouse", "rat", "dog", "cat")
animals

# find the length 
length(animals)

# find the class
class(weight_kg)
class(animals)

# examing the structure
str(weight_kg)

str(animals)

# Tab complete
z # R gives us a lot of options!

# combine data together
c(weight_kg, animals)

# Basic types in R
# + Numeric
# + Integer
# + Boolean
# + Character
# + Complex
# + Raw

# Subetting
animals
# let's only pull out dog 
animals[3]
animals[c(4, 3)]
more_animals <- animals[c(1, 2, 1, 1, 1, 3, 3, 3, 3, 3)]
more_animals

# Conditional subsetting
weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]
weight_g > 50
weight_g[weight_g > 50]

# Conditional subsetting can be combined
weight_g[weight_g >= 30 & weight_g == 21]
weight_g[weight_g < 30 | weight_g > 50]

# == vs. =
# When to use =
round(x = 3.14, digits = 1)
rounded_pi = round(x = 3.14, digits = 1) # alternative way to assign objects
# equality is signalled with double equals
14 == 15


# Starting with data ------------------------------------------------------

# Section headers are produced with cntrl+shift+r. You can also type things in multiples of 4 or 5 will work to make a section. 

# download data onto computer
download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")

# bring data into R as an object
surveys <- read.csv("data/portal_data_joined.csv")

surveys
head(surveys)
str(surveys)

# functions to investigate a data.frame
# Size
dim(surveys)
nrow(surveys)
ncol(surveys)
# Content
head(surveys)
tail(surveys)
# Names
names(surveys)
colnames(surveys) # synonymous with names for a data.frame
rownames(surveys)
# summary
str(surveys)
summary(surveys)

# subsetting data frames
surveys[1, 1] # rows are in the first position, columns are in the second
surveys[1, 6]
names(surveys)[6]

surveys[ , 1] # blank in first position indicates I want all rows

surveys[1] # R knows this refers to columns, and gives me back a dataframe

surveys[1:6]
surveys[c(1, 3 , 5)]

surveys[1:6, ] # to get rows 1:6
surveys[1, ] #comes back as a dataframe
# subsetting a dataframe with column name
surveys["species_id"]
surveys[ , "species_id"]
surveys[1:6, ]
surveys[["species_id"]]
surveys$species_id

# Factors
read.csv("data/portal_data_joined.csv", stringsAsFactors = FALSE)

levels(surveys$species_id)
nlevels(surveys$species_id)

table(surveys$species_id) # handy way to look at what ya got

is.factor(surveys$plot_id)


# dplyr (tidy verse) ------------------------------------------------------

library(tidyverse)

surveys <- readr::read_csv("data/portal_data_joined.csv") # the :: helps designate a specific library to load a function from, but tidyverse loads readr by default


# verbs of dplyr ----------------------------------------------------------

# select (a way to choose columns)
select(surveys, plot_id, species_id, weight)

# filter (is a way to choose rows)
filter(surveys, year == 1995)

# how to get all surveys from June?
filter(surveys, month == 6)


# PIPES IN R --------------------------------------------------------------

# use cmd (or cntrl) + shift + m
# %>% 
surveys2 <- filter(surveys, weight > 2) %>% 
  select(species_id, sex, weight)
  
  
  
