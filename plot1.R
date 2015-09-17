setwd("~/R/COURSES/EXP/ELECTRICITY")
df <- read.table("household_power_consumption.txt", sep = ";",  header = T, na.strings = "?")
str(df)

df1 <- subset(df, as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") |
                as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))



png(filename = "plot1.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)
hist(df1$Global_active_power, col = "red", xlab = "Global active power (Kilowatts)", 
     main = "Global active power", las = 1)
dev.off()
