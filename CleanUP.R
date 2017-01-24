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
