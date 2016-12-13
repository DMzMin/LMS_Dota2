#script to wrangle the new data frames into cleaner informaiton

#convert start times from seconds into dates & times using origin 1970-01-01 and tz 'UTC'
MatchDF <- MatchDF %>% mutate(time_stamp = as.POSIXct(start_time, tz = "UTC", origin = "1970-01-01"))

#add days of the week
MatchDF <- MatchDF %>% mutate(day = weekdays(time_stamp))

#add team_name column to PlayersDF based upon player_slot variable where 0:4 ==Radiant and 128:132 == Dire
PlayersDF <- PlayersDF %>% mutate(team_name = ifelse(player_slot >= 0 & player_slot <= 4,"Radiant", ifelse(player_slot >=128 & player_slot <=132, "Dire", NA)))

teamcomp <- PlayersDF %>% select(player_slot, team_name)
