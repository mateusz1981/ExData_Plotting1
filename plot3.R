df <- read.table("household_power_consumption.txt", sep = ";",  header = T, na.strings = "?")
str(df)

df1 <- subset(df, as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") |
                as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))

df1$d_and_t <- as.POSIXct(strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

plot(x = df1$d_and_t, y = df1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(x= df1$d_and_t, y = (df1$Sub_metering_2), col = "red", type = "l")
points(x = df1$d_and_t, y = as.numeric(df1$Sub_metering_3), col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
