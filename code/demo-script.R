# Title: Descriptive Analysis
# Description: 
#    This script computes descriptive statistics, as well as 
#    various exploratory data visualizations.
# Input(s): data file 'nba2018-players.csv'
# Output(s): summary of the data and plots
# Author(s): Anqi Chen
# Date: 10-02-2019


# Packages
library("dplyr")
library("ggplot2")
library("readr")


# Importing a data
dat <- read.csv("../data/nba2018-players.csv",sep=",")
was <- filter(dat,team=="WAS")
write.csv(was,"../data/was.csv")


# Exportin some R output

# exporting structure of dat
str(dat)
sink("../output/data-structure.txt")
str(dat)
sink()

# exporting summary for WAS
sink("../output/summary-warriors.txt")
summary(was)
sink()

# exporting summmary about LAL
lakers <- filter(dat,team=="LAL")
sink("../output/summary-lakers.txt")
summary(lakers)
sink()


# Exporting graphs

# frequency of age
jpeg("../images/histogram-age.jpeg",width = 600,height = 400)
hist(dat$age,xlab = "Age",ylab = "Count")
dev.off()

# png for scatterplot
png(filename = "../images/scatterplot-height-weight.png")
plot(dat$height, dat$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

# second scatterplot for height and weight
png("../images/scatterplot2-height-weight.png")
ggplot(dat,aes(x=dat$height,y=dat$weight))+
  geom_point(aes(size=2))+
  labs(x="Heigh",y="Weight")+
  theme_bw()
dev.off()

# save with ggsave
ggplot(dat,aes(x=dat$height,y=dat$weight))+
  geom_point()+
  facet_wrap(dat$position)+
  labs(x="Heigh",y="Weight")+
  theme_bw()
ggsave("../images/height_weight_by_position.pdf")

