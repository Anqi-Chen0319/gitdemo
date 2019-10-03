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

# Importing a data
read.csv("../data/nba2018-players.csv",sep=",")
was <- filter("../data/nba2018-players.csv",team=="WAS")

