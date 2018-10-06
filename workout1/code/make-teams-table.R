# ==================================================================
#Title: Workout 01
# Description:
#   This is a data preparation for the nba2018.csv. We will be
#   Creating variables that will be used in the final analysis. 
# Input(s): data file 'nba2018.csv'
# Output(s): data file 'nba2018-teams.csv'
# Author: Joey Kratz
# Date: 10-03-2018
# ==================================================================
library(readr)    # importing data
library(dplyr)    # data wrangling
dat <- read_csv("Desktop/stat133-hws-fall2018/workout1/data/nba2018.csv")
dat$experience[dat$experience=="R"] = 0
as.integer(dat$experience) #Replacing all "R"s with 0 and converting to integers
dat$salary <- dat$salary/1000000 #making salary in terms of millions
factor(dat$position, c("C", "PF", "PG", "SF", "SG"), 
       c("center", "power_fwd", "point_guard", "small_fwd", "shoot_guard"))
dat$position[dat$position=="C"] = "center"
dat$position[dat$position=="PF"] = "power_fwd"
dat$position[dat$position=="PG"] = "point_guard"
dat$position[dat$position=="SF"] = "small_fwd"
dat$position[dat$position=="SG"] = "shoot_guard"

dat %>% mutate(missed_fg= field_goals_atts-field_goals)

dat %>% mutate(missed_ft= points1_atts-points1)

dat %>% mutate(rebounds= off_rebounds+def_rebounds)

dat %>% mutate(efficiency=points+rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers) / games_played

sink()


