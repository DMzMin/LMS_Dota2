# Install and activate dplyr and tidyr (remove #s below to install packages if not already installed)
# install.packages("dplyr")
# install.packages("tidyr")

library("dplyr")
library("tidyr")

# Read raw files players.csv and match.csv into project

players <- read.csv("players.csv")
match <- read.csv("match.csv")

# Clean match.csv file and collect key infomation into one data frame

MatchDF <- match %>% select(1 : 5, 10)

# Clean players.csv file and collect key infomation into one data frame

PlayersDF <- players %>% select(1 : 17)

# Convert start time from seconds to date in MatchDF

MatchDF <- MatchDF %>% mutate(date = as.POSIXct(MatchDF$start_time, tz = "UTC", origin = "1970-01-01"))

# Combine PlayersDF and MatchDF into CombinedDF

CombinedDF <- merge(PlayersDF, MatchDF, by = "match_id")

# Load and examine 'hero_names.csv'

Hero_Names <- read.csv("hero_names.csv")
glimpse(Hero_Names)

# Clean up Hero_Names data frame, removing the column 'name'

Hero_Names[1] <- NULL
colnames(Hero_Names) <- c("hero_id", "Hero_Names")
head(Hero_Names, n = 3)

# Add a row defining hero_id '0' as 'NA'
Hero_Names <- add_row(Hero_Names, hero_id = 0, Hero_Names = "NA")
Hero_Names <- arrange(Hero_Names, hero_id)
## don't need to specify the extra hero_id, use left_join instead ##
CombinedDF <- merge(CombinedDF, Hero_Names, by = "hero_id")
CombinedDF <- arrange(CombinedDF, match_id, player_slot)

# Place CombinedDF columns into a better order
glimpse(CombinedDF)
CombinedDF <- CombinedDF[,c(2:4,1,24,9:18,23,19:22,5:8)]

# The dataset should be limited to matches that last between 20 - 90 minutes (1200 - 5400
# seconds)
CombinedDF$Trange <- between(CombinedDF$duration, 1200, 5400)
print(table(CombinedDF$Trange))

# This has identified 495,460 matches whose durations are between 20 - 90 minutes and
# 4540 matches outside these limits.



# Remove redundant data frames (remove #s to activate)
#rm(MatchDF)
#rm (PlayersDF)

glimpse(CombinedDF)
  