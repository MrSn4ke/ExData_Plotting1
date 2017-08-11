rm(list = ls())

library(tidyverse)
library(magrittr)
library(lubridate)

df <- read.csv2("household_power_consumption.txt", header = TRUE)

df2 <- df %>% filter(Date %in% c("1/2/2007", "2/2/2007"))

df2$Global_active_power %<>% as.character %>% as.numeric

hist(df2$Global_active_power, col = "red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()
