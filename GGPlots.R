# load ggplot2
library(ggplot2)
library(dplyr)

# glimpse at MatchDF data frame. MatchDF is preferred over CombinedDF for this to avoid plotting each point ten times.
glimpse(MatchDF)

# TowerStat_R is the health difference between Radiant and Dire towers at the end of each game.
TowerStat_R <- MatchDF$tower_status_radiant - MatchDF$tower_status_dire

# data frame containing match_duration, TowerStat_R and radiant_win status
TvTowerStatus <- data.frame(MatchDF$duration, TowerStat_R, MatchDF$radiant_win)
colnames(TvTowerStatus) <- c("Duration", "TowerStat_R", "Radiant_Win")

# GGplot to compare match durations against difference between Radiant and Dire towers health
# coloured by radiant_win variable.

ggplot(TvTowerStatus, aes(x = Duration, y = TowerStat_R, colour = Radiant_Win)) + geom_point()

# this plot shows both teams can still win matches when their total tower health status is less than their opponents.
# this plot shows cut-offs for strong wins and close matches at 500 / -500 tower health difference.
# between 500 and - 500 indicates a close match.  Outside these values indicates a strong win.

# The dataset should be limited to matches that last between 20 - 90 minutes (1200 - 5400 seconds)
range <- between(CombinedDF$duration, 1200, 5400)
table(range)

# This has identified 495,460 matches whoes durations are between 20 - 90 minutes and 4540 matches outside these durations



ggplot(CombinedDF, aes(x = Hero_Names, y = kills, col = radiant_win)) +
  geom_point() +
  facet_grid(CombinedDF$radiant_win~.)

range <- between(CombinedDF$duration, 1200, 5400)
table(range)
495460 + 4540
