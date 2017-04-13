Tallykills <- CombinedDF %>% group_by(match_id, team, radiant_win) %>% tally(kills)
Tallykills <- spread(Tallykills, team, n)
colnames(Tallykills) <- c("match_id", "radiant_win", "Dire_Kills", "Radiant_Kills")

GGTK <- ggplot(Tallykills, aes(x = (Radiant_Kills - Dire_Kills), color = radiant_win, fill = radiant_win)) + geom_bar(position = "dodge")
print(GGTK)

TallyHeroKills <- CombinedDF %>% group_by(Hero_Names, team, radiant_win) %>% tally(kills)
THK_rw <- spread(TallyHeroKills, radiant_win, n)
THK_team <- spread(TallyHeroKills, team, n)

colnames(TallyHeroKills) <- c("Hero_Names", "Dire_Win", "Radiant_Win")

GGHeros <- ggplot(TallyHeroKills) + geom_bar(aes(x = Hero_Names, y = n), position = "dodge", stat = "identity")
GGHeros + theme(axis.text.x = element_text(angle = -90, hjust = 0.5))

head(TallyHeroKills, n = 10)

HeroWL <- test %>% group_by(Hero_Names, WL) %>% tally()
HeroWL <- spread(HeroWL, WL, n)
HeroWL

test <- CombinedDF
test$WL <- ifelse(test$radiant_win == "True" & test$team == "R", "Win", 
                  ifelse(test$radiant_win == "True" & test$team == "D", "Loss", 
                         ifelse(test$radiant_win == "False" & test$team == "R", "Loss", "Win")))

head(test)

WLTally <- match %>% group_by(radiant_win) %>% tally()
WLTally

WLSpread <- WLTally %>% spread(radiant_win, n)
WLSpread

diff <- 25943-24057
diff
diffP <- diff/50000
Hero_Bar$WinPct <- round(Hero_Bar$Win/(Hero_Bar$Win + Hero_Bar$Loss), digits = 2)

Hero_Bar <- Hero_Bar %>% mutate(WinPct = Hero_Bar$Win/(Hero_Bar$Win + Hero_Bar$Loss))

Hero_Bar

# the difference between Radiant wins and Dire wins is 3.772% of the total population sampled.  May require a null hypothesis check to see if there is a bias towards either team.

hist(x = WLSpread)

write.csv(Hero_Names, "Hero_Names.csv")

# histogram all variables

ggplot(data = melt(match), aes(x = value)) + 
  geom_histogram(bin = 100) + 
  facet_wrap(~variable, scales = "free_x") 

library(reshape2)

melt(match)

hist(TowerStat_R)

leavestat <- players %>% group_by(leaver_status) %>% tally()
head(Hero_Names, n=10)

ggplot(data = melt(P), aes(x = value)) + 
  geom_histogram(bin = 10) + 
  facet_wrap(~variable, scales = "free_x")
max(players$hero_healing)



ggplot(data = melt(P), aes(x = value)) + 
  geom_histogram(bins = 20) + 
  facet_wrap(~variable, scales = "free_x")


ggplot(data = melt(P), aes(x = value)) + 
  geom_histogram(bins = 10) + 
  facet_wrap(~variable, scales = "free_x") + 
  theme(axis.text.x = element_text(angle = 20, hjust = 1))


MatchCols <- c("match_id", "start_time", "duration", "tower_status_radiant", "tower_status_dire", "barracks_status_dire", "barracks_status_radiant", "first_blood_time", "game_mode", "radiant_win", "date")

Carry     - "Will become more useful later in the game if they gain a significant gold advantage."
Disabler  - "Has a guaranteed disable for one or more of their spells."
Initiator - "Good at starting a teamfight."
Jungler   - "Can farm effectively from neutral creeps inside the jungle early in the game."
Support   - "Can focus less on amassing gold and items, and more on using their abilities to gain an advantage for the team."
Durable   - "Has the ability to last longer in teamfights."
Nuker     - "Can quickly kill enemy heroes using high damage spells with low cooldowns."
Pusher    - "Can quickly siege and destroy towers and barracks at all points of the game."
Escape    - "Has the ability to quickly avoid death."

