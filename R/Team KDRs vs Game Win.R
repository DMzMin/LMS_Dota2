# Determine team Kill:Death Ratios (KDRs) and compare against game win/loss status

for (x in players$match_id) {
  for (y in players$player_slot) {
    y < 5
    RTeamKills <- sum(players$kills)
    RTeamDeaths <- sum(players$deaths)
  }
  for (z in players$player_slot) {
    z > 5
    DTeamKills <- sum(players$kills)
    RTeamDeaths <- sum(players$deaths)
  }

}



