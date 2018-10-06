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

sink(file="Desktop/stat133-hws-fall2018/workout1/output/efficiency-summary.txt")
summary(dat$efficiency)
sink()
# Because I was in the /user directory, this is the path I used above. 
# If I was in the /code directory, my path would have looked like
# file = "../output/efficiency-summary.txt"
dat$experience <- as.integer(dat$experience)
team <- count(dat, team)[, 1]
experience <- summarise(group_by(dat, team), experience = sum(experience))[, 2]
salary <- summarise(group_by(dat, team), salary = round(sum(salary)), 2)[, 2]
points3 <- summarise(group_by(dat, team), points3 = sum(points3))[, 2]
points2 <- summarise(group_by(dat, team), points2 = sum(points2))[, 2]
points1 <- summarise(group_by(dat, team), points1 = sum(points1))[, 2]
points <-  summarise(group_by(dat, team), points = sum(points))[, 2]
off_rebounds <- summarise(group_by(dat, team), off_rebounds = sum(off_rebounds))[, 2]
def_rebounds <- summarise(group_by(dat, team), def_rebounds = sum(def_rebounds))[, 2]
assists <- summarise(group_by(dat, team), assists = sum(assists))[, 2]
steals <- summarise(group_by(dat, team), steals = sum(steals))[, 2]
blocks <- summarise(group_by(dat, team), blocks = sum(blocks))[, 2]
turnovers <- summarise(group_by(dat, team), turnovers = sum(turnovers))[, 2]
fouls <- summarise(group_by(dat, team), fouls = sum(fouls))[, 2]
efficiency <- summarise(group_by(dat, team), efficiency = sum(efficiency))[, 2]

teams <- data.frame(team, experience, salary, points3, points2, points1, 
                    points, off_rebounds, def_rebounds, assists, steals,
                    blocks, turnovers, fouls, efficiency)

sink(file="Desktop/stat133-hws-fall2018/workout1/output/teams-summary.txt")
summary(teams)
sink()

write.csv(teams, file = "Desktop/stat133-hws-fall2018/workout1/data/nba2018-teams.csv", 
          row.names = FALSE)








