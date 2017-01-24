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

# Replace Hero_ID numbers with Hero names

Hero_Names <- read.csv("hero_names.csv")
glimpse(Hero_Names)

# Clean up Hero_Names data frame, removing the column 'name'

Hero_Names[1] <- NULL
colnames(Hero_Names) <- c("hero_id", "Names")
head(Hero_Names, n = 3)

test <- merge(CombinedDF, Hero_Names, by = "hero_id")
ungroup(test)
test1 <- test %>% select(1, 24)

# Remove redundant data frames
rm(MatchDF)
rm(PlayersDF)
