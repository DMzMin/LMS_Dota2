1. Dota 2 Presentation
========================================================

author: Louis Montagu-Smith
date: 10th April 2017
autosize: true
transition: rotate
transition-speed: slow


![](Dota2_logo.png)
![](Dota2_front.jpg)

<small>http://blog.dota2.com/</small>



2. What is Defence Of The Acients 2?
========================================================

![](Dota_2_minimap.jpg)

***

Dota 2 is a popular multiplayer online battle arena (MOBA) game

2 teams of 5 heroes playing for the Radiants (green) and the Dires (red)

Objective to access enemies base and destroy their Acient structure

Players control heroes to fight enemy heroes, towers and AI-controlled creep



3. How does a Dota 2 match play out?
========================================================

![](Dota_2_minimap.jpg)

***

At the start of a match the barracks for each side automatically produce AI-controlled units called 'Creep'

Heroes escort the packs of Creep along lanes towards enemy towers

Towers do lots of damage to Heroes so they must wait until friendly Creep enguage the towers to be able to take them down

Removing enemy towers allows for better access to enemy bases and their Ancient structure


4. The Dataset
========================================================

A dataset with data on 50,000 matches was published to Kaggle by Devin, which can be found here:

https://www.kaggle.com/devinanzelmo/dota-2-matches

Here several csv files can be found covering a wide range of data on all players in each match leading to 500,000 observations

Two key files were identified:
- match.csv
- players.csv

One support file was identified:
- hero_names.csv


5. Match.csv 
========================================================


|Variable                |Description                                                          |
|:-----------------------|:--------------------------------------------------------------------|
|match_id                |unique interger to identify matches accross all files                |
|start_time              |match start time in seconds since 00:00, 01/01/1970, UTC             |
|duration                |length of match in seconds                                           |
|tower_status_radiant    |total health of all Radiant towers at match end                      |
|tower_status_dire       |total health of all Dire towers at match end                         |
|barracks_status_dire    |total health of all Dire barracks at match end                       |
|barracks_status_radiant |total health of all Radiant barracks at match end                    |
|first_blood_time        |timestamp in seconds of when first player is killed from match start |
|game_mode               |an integer indicating which game mode the match is playing           |
|radiant_win             |a factor indicating if the radiant team won or lost the match        |
|negative_votes          |number of negative votes a match recieved                            |
|positive_votes          |number of positive votes a match recieved                            |
|cluster                 |integer indicating which region of the world the match was played    |


6. Duration Variable
========================================================

![](Duration_raw.png)
Histogram plot of duration variable

***

![](Duration_filter.png)
Histogram plot of duration variable between 15 and 75 minutes


7. Players.csv
========================================================


|Variables                 |Descriptions                                                                            |
|:-------------------------|:---------------------------------------------------------------------------------------|
|match_id                  |unique interger to identify matches accross all files                                   |
|account_id                |unique interger to identify players. 0 (zero) represent annonomous players              |
|hero_id                   |unique interger to identify which hero was selected per player                          |
|player_slot               |unique interger where 0-4 represent players on Radiant side and 128-132 the Dire side   |
|gold                      |amount of gold player has at match end                                                  |
|gold_spent                |amount of gold player spent during the match                                            |
|gold_per_min              |amount of gold per minute a player accumulated on average during the match              |
|xp_per_min                |amount of experience points per minute a player accumulated on average during the match |
|kills                     |total kills a player scored per match                                                   |
|deaths                    |number of times a player died per match                                                 |
|assists                   |number of assists a player gained per match                                             |
|denies                    |number of denies a player performed per match                                           |
|last_hits                 |number of last hits a player landed on creep per match                                  |
|stuns                     |cumulative amount of time a player stunned an enemy player                              |
|hero_damage               |cumulative amount of damage a player caused to enemy heroes                             |
|tower_damage              |cumulative amount of damage a player caused to enemy towers                             |
|item_0 to _5              |integers referring to items a player equiped during the match                           |
|level                     |the hero character level a player obtained by match end                                 |
|leaver_status             |integer indicating if a player stayed until match end or left early                     |
|xp_hero                   |experience points gained from killing heros                                             |
|xp_creep                  |experience points gained from killing creep                                             |
|xp_roshan                 |experience points gained from killing Roshan, neutral creep boss in jungle              |
|xp_other                  |experience points gained from other sources                                             |
|gold_other                |gold gained from other non-conventional sources                                         |
|gold_death                |cumulative amount of gold lost due to death                                             |
|gold_buyback              |gold spent buying back lost items                                                       |
|gold_abandon              |gold abandoned by a player                                                              |
|gold_sell                 |gold gained from selling items                                                          |
|gold_destroying_structure |gold gained from destroying structures e.g. tower, barracks, ancient                    |
|gold_killing_heros        |gold gained from killing enemy heroes                                                   |
|gold_killing_creep        |gold gained from killing creeps                                                         |
|gold_killing_roshan       |gold gained from killing Roshan, high level neutral creep boss in jungle                |
|gold_killing_couriers     |gold gained from killing enemy courriers                                                |



8. 
========================================================

After analysis of these two key files they were combined into one data frame called 'CombinedDF'


9. 
========================================================




10. 
========================================================


