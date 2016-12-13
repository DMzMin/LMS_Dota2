# adding comments for fun!
# finding out min and max of each variable
library(dplyr)

min(players$tower_damage)
max(players$tower_damage)

str(MatchDF)
  
hist(match$duration, breaks = 100, col = "red", label = TRUE)

sd(match$duration)
mean(match$duration)

MatchDF$duration %>%
  summary()


# load ggplot2
library(ggplot2)

# TowerStat_R is the health difference between Radiant and Dire towers at the end of each game.
BarracksStat_R <- match$barracks_status_radiant - match$barracks_status_dire

# data frame containing match_duration, TowerStat_R and radiant_win status
TvBarracksStatus <- data.frame(match$duration, BarracksStat_R, match$radiant_win)

# GGplot to compare match durations against difference between Radiant and Dire towers health
# coloured by radiant_win variable.

ggplot(TvBarracksStatus) + geom_point(aes(x = TvBarracksStatus$match.duration, y = BarracksStat_R, colour = TvTowerStatus$match.radiant_win))

# this plot shows both teams can still win matches when their total tower health status is less than their opponents.
# this plot shows cut-offs for strong wins and close matches at 500 / -500 tower health difference.
# between 500 and - 500 indicates a close match.  Outside these values indicates a strong win.
