### Zilu Sun ###

### Homework 2                                         ###
### GGPlot Basics ###

#Put your code in this file. Make sure you assign the relevant values to the correct variable names, which are given below. 
#Uncomment the variables as you assign your final values/functions/results to them.

library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(stringr)# This loads the packages necessary to run your plots. Do not delete or comment this out.

### Exercise 1
library(ggplot2)
data2.1 <- read.csv("SPX-1Month.csv")
spx_plot1<- ggplot(data2.1, aes(x = Date, y = Close.Last, group = 1)) + geom_line() + geom_point()
spx_plot1
??labs()
spx_plot2<- ggplot(data2.1, aes(x = Date, y = Close.Last, group = 1)) + geom_line() + geom_point() + labs(title = "S&P500 − Closing Price over the Last Month")+ labs(y = "Close price") +theme(axis.text.x = element_text(angle = 45, hjust = 1))
spx_plot2

### Exercise 2
data2.2 <- read.csv("BookGenres.csv") 
bookplot <- ggplot(data2.2, aes(x = Category, y = Price, color = Season)) +
  geom_point(alpha = 0.40) + 
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 30, hjust = 1)) + 
  labs(title = "The Price of Fiction Books by Genre and Season",
       x = "Genre", 
       y = "Price") 
bookplot

### Exercise 3
data2.3 <- read.csv("squirrel.csv")
squirrelPlot <- ggplot(data2.3, aes(x = Activities, fill = Interactions.with.Humans)) +   
  geom_bar(stat = "count", position = "dodge",alpha = 0.5) +   
  theme_grey() +   
  labs(title = "Squirrel Behavior in NYC Parks",  
       x = "Squirrel Activity",  
       y = "Count",  
       fill = "Interactions with Humans") +  
  scale_fill_manual(values = c("Approaches" = "red",   
                               "Indifferent" = "green",  
                               "Runs from" = "skyblue",  
                               "Watching/Cautious" = "purple")) 
squirrelPlot

### Exercise 4
data2.4 <- read.csv("big_mac.csv")
#1
bigMac <- ggplot(data2.4, aes(x = as.numeric(GDP.Per.Capita), y = dollar_price)) +
  geom_point() +  
  geom_smooth() +
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index",
       x = "Dollar Price of a Big Mac",
       y = "GDP per Capita in Dollars") +
  theme_grey()

bigMac

#2
data2.4$GDP.Per.Capita <- as.numeric(gsub("[^0-9.]", "", data2.4$GDP.Per.Capita))
data2.4$Log.GDP.Per.Capita <- log(data2.4$GDP.Per.Capita)
logBigMac <- ggplot(data2.4, aes(x = Log.GDP.Per.Capita, y = dollar_price)) +
  geom_point() +  
  geom_smooth() +
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index",
       x = "Dollar Price of a Big Mac",
       y = "Log of Dollar GDP Per Capita") +
  theme_grey()

logBigMac
