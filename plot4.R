

df <- read.table("household_power_consumption.txt", sep = ";",  header = T, na.strings = "?")
str(df)

df1 <- subset(df, as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") |
                as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))

par(mfrow = c(2, 2), cex = 0.6)

png(filename = "plot4.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)



#1
plot(df1$d_and_t, (as.numeric(df1$Global_active_power)), type = "l",  xlab = "", ylab = "Global Active Power (Kilowatts)")

#2
plot(x = df1$d_and_t, y = df1$Voltage, type = "l", ylab = "Voltage", xlab = "")

#3
plot(x = df1$d_and_t, y = df1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(x= df1$d_and_t, y = (df1$Sub_metering_2), col = "red", type = "l")
points(x = df1$d_and_t, y = as.numeric(df1$Sub_metering_3), col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#4
plot(x = df1$d_and_t, y = df1$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")



dev.off()