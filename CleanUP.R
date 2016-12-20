#install and activate dplyr and tidyr
install.packages("dplyr")
install.packages("tidyr")

library("dplyr")
library("tidyr")

#read raw files players.csv and match.csv into project

players <- read.csv("players.csv")
match <- read.csv("match.csv")

#clean match.csv file and collect key infomation into one data frame

MatchDF <- match %>% select(1 : 5, 10)

#clean players.csv file and collect key infomation into one data frame

PlayersDF <- players %>% select(1 : 17)

#convert start time from seconds to date in MatchDF

MatchDF <- MatchDF %>% mutate(date = as.POSIXct(MatchDF$start_time, tz = "UTC", origin = "1970-01-01"))

