# Linear modelling Gold vs Duration

# xy plot of duration vs gold
ggplot(CombinedDF, aes(x = duration, y = gold, col = WL)) +
  geom_point(size = 0.2)

# examining linear model between duration and gold
model1 <- lm(gold ~ duration, data=CombinedDF)
summary(model1)

# here we see the model has very low P values which means we can reject the null hypothesis that these two variables 
# have no correlation, but the R^2 value of 0.02127 is very low indicating vey high variance.

# lets add WL as a predictor
model2 <- lm(gold ~ duration + WL, data=CombinedDF)
summary(model2)

# This improves R^2 significantly but it is still quite low at 0.2873. 

# Lets add Hero_Names as a predictor
model3 <- lm(gold ~ duration + WL + Hero_Names, data=CombinedDF)
summary(model3)

# lets add kills as a predictor but remove Hero_Names
model4 <- lm(gold ~ duration + WL + kills, data=CombinedDF)
summary(model4)

# lets add gold_death as a predictor
model5 <- lm(gold ~ duration + WL + kills + gold_death, data=CombinedDF)
summary(model5)

# plotting just the wins of the top 10 most selected heroes
Cwin <- CombinedDF %>% filter(WL == "Win", Hero_Names == c("Windranger", 
                                                           "Shadow Fiend", 
                                                           "Invoker", 
                                                           "Slardar", 
                                                           "Earthshaker", 
                                                           "Queen of Pain", 
                                                           "Juggernaut", 
                                                           "Tusk", 
                                                           "Alchemist", 
                                                           "Anti-Mage"))
ggplot(Cwin, aes(x = duration, y = gold, col = Hero_Names)) +
  geom_point(size = 0.2)

# gather data on Windranger only, the most selected hero
Windranger <- CombinedDF %>% filter(Hero_Names == "Windranger")
ggplot(Windranger, aes(x = duration, y = gold, col = WL)) +
  geom_point(size = 0.2)

WR_model1 <- lm(gold ~ duration, data=Windranger)
summary(WR_model1)


# LOGISTICAL REGRESSION

