rm(list = ls())

library(tidyverse)
library(magrittr)
library(lubridate)

df <- read.csv2("household_power_consumption.txt", header = TRUE)

df2 <- df %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
  mutate(datetime = dmy_hms(paste(Date,Time)))

df2$Sub_metering_1 %<>% as.character %>% as.numeric
df2$Sub_metering_2 %<>% as.character %>% as.numeric
df2$Sub_metering_3 %<>% as.character %>% as.numeric

plot(x = df2$datetime, y = df2$Sub_metering_1, type = "l",
     xlab = "", ylab="Energy sub metering")
lines(x = df2$datetime, y = df2$Sub_metering_2, col="red")
lines(x = df2$datetime, y = df2$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col=c('black','red','blue'))

dev.copy(png,'plot3.png')
dev.off()
