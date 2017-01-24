# load ggplot2
library(ggplot2)
library(dplyr)

# glimpse at CombinedDF data frame
glimpse(CombinedDF)

# TowerStat_R is the health difference between Radiant and Dire towers at the end of each game.
TowerStat_R <- CombinedDF$tower_status_radiant - CombinedDF$tower_status_dire

# data frame containing match_duration, TowerStat_R and radiant_win status
TvTowerStatus <- data.frame(CombinedDF$duration, TowerStat_R, CombinedDF$radiant_win)
colnames(TvTowerStatus) <- c("Duration", "TowerStat_R", "Radiant_Win")

# GGplot to compare match durations against difference between Radiant and Dire towers health
# coloured by radiant_win variable.

ggplot(TvTowerStatus, aes(x = Duration, y = TowerStat_R, colour = Radiant_Win)) + geom_point()

# this plot shows both teams can still win matches when their total tower health status is less than their opponents.
# this plot shows cut-offs for strong wins and close matches at 500 / -500 tower health difference.
# between 500 and - 500 indicates a close match.  Outside these values indicates a strong win.

ggplot(CombinedDF, aes(x = hero_id, y = kills)) +geom_point()
