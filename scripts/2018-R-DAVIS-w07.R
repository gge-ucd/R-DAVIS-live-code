# R-DAVIS 2018
# Week 07
library(tidyverse)

# visualizations:
## a base plot
plot(x=iris$Petal.Width)

## a ggplot
ggplot() + 
  geom_point(data=iris, aes(x=Petal.Width, y=Petal.Length, shape=Species, size=Species))# not ideal

ggplot() + 
  geom_point(data=iris, 
             aes(x=Petal.Width, y=Petal.Length, shape=Species, alpha=Species))

# add viridis
install.packages("viridisLite")
install.packages("viridis")
library(viridis)

# use discrete colors as viridis
ggplot() + geom_point(data=iris, aes(x=Petal.Width, y=Petal.Length, color=Species)) +
  scale_color_viridis(discrete = TRUE) # make sure to set discrete=TRUE

# use fill

# to use fill, you need to set it to a point type (or "pch") that has a hollow center. Use ?pch to see the various point types. Notice that 21 through 28 are hollow.
ggplot() + geom_point(data=iris, aes(x=Petal.Width, y=Petal.Length, fill=Species), pch=21) +
  scale_fill_viridis("Flowers", discrete = TRUE)

# combine color and shape
ggplot() + geom_point(data=iris, aes(x=Petal.Width, y=Petal.Length, color=Species, shape=Species)) +
  scale_color_viridis("Flowers", discrete = TRUE)

# to keep one single legend, make sure legend name is identical
ggplot() + geom_point(data=iris, aes(x=Petal.Width, y=Petal.Length, color=Species, shape=Species)) +
  scale_color_viridis("Species", discrete = TRUE)






