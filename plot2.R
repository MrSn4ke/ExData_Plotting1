rm(list = ls())

library(tidyverse)
library(magrittr)
library(lubridate)

df <- read.csv2("household_power_consumption.txt", header = TRUE)

df2 <- df %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
  mutate(datetime = dmy_hms(paste(Date,Time)))

df2$Global_active_power %<>% as.character %>% as.numeric

plot(x = df2$datetime, y = df2$Global_active_power, type = "l",
     xlab = "", ylab="Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()
