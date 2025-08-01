rm(list=ls())  # removes all variables stored previously

#  Load necessary package
library(Hmisc)  # for describe()

#  Load dataset
data <- read.csv("D:/Corona Analysis/COVID19_line_list_data.csv") 


#  Summary of dataset
describe(data)

#  Create binary death column
data$death_dummy <- as.integer(data$death != 0)

#  Overall death rate
death_rate <- sum(data$death_dummy) / nrow(data)
print(paste("Death Rate:", round(death_rate * 100, 2), "%"))

#  AGE Analysis
dead <- subset(data, death_dummy == 1)
alive <- subset(data, death_dummy == 0)

mean_dead_age <- mean(dead$age, na.rm = TRUE)
mean_alive_age <- mean(alive$age, na.rm = TRUE)
print(paste("Mean age (dead):", round(mean_dead_age, 1)))
print(paste("Mean age (alive):", round(mean_alive_age, 1)))

t_age <- t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
print(t_age)

#  GENDER Analysis
men <- subset(data, gender == "male")
women <- subset(data, gender == "female")

mean_men_death <- mean(men$death_dummy, na.rm = TRUE)
mean_women_death <- mean(women$death_dummy, na.rm = TRUE)
print(paste("Death rate (men):", round(mean_men_death * 100, 1), "%"))
print(paste("Death rate (women):", round(mean_women_death * 100, 1), "%"))

t_gender <- t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
print(t_gender)

# Boxplot: Age by Death Status
png("boxplot_age_by_death.png", width = 800, height = 600)
boxplot(age ~ death_dummy,
        data = data,
        main = "Age Distribution by Death Status",
        xlab = "Death (0 = Alive, 1 = Dead)",
        ylab = "Age",
        col = c("lightblue", "salmon"))
dev.off()



# 2. Barplot: Death Rate by Age Group

# Create age group categories
data$age_group <- cut(data$age,
                      breaks = c(0, 20, 40, 60, 80, 100, Inf),
                      labels = c("0-20", "21-40", "41-60", "61-80", "81-100", "100+"))

# Calculate death rate per age group
age_group_table <- aggregate(death_dummy ~ age_group, data = data, FUN = mean)
age_group_table$death_dummy <- round(age_group_table$death_dummy * 100, 2)

# Barplot of death rates by age group
png("barplot_death_rate_by_age_group.png", width = 800, height = 600)
barplot(height = age_group_table$death_dummy,
        names.arg = age_group_table$age_group,
        col = "coral",
        main = "Death Rate by Age Group (%)",
        ylab = "Death Rate (%)",
        xlab = "Age Group")
dev.off()