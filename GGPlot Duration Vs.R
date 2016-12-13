# load ggplot2
library(ggplot2)

# TowerStat_R is the health difference between Radiant and Dire towers at the end of each game.
TowerStat_R <- match$tower_status_radiant - match$tower_status_dire

# data frame containing match_duration, TowerStat_R and radiant_win status
TvTowerStatus <- data.frame(match$duration, TowerStat_R, match$radiant_win)

# GGplot to compare match durations against difference between Radiant and Dire towers health
# coloured by radiant_win variable.

ggplot(TvTowerStatus) + geom_point(aes(x = TvTowerStatus$match.duration, y = TowerStat_R, colour = TvTowerStatus$match.radiant_win))

# this plot shows both teams can still win matches when their total tower health status is less than their opponents.
# this plot shows cut-offs for strong wins and close matches at 500 / -500 tower health difference.
# between 500 and - 500 indicates a close match.  Outside these values indicates a strong win.
