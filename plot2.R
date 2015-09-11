df <- read.table("household_power_consumption.txt", sep = ";",  header = T, na.strings = "?")
str(df)

df1 <- subset(df, as.Date(Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") |
                as.Date(Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y"))


df1$d_and_t <- as.POSIXct(strptime(paste(df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S"))


Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", width = 480, height = 480,
    units = "px", pointsize = 12, bg = "white", res = NA,
    restoreConsole = TRUE)

plot(df1$d_and_t, (as.numeric(df1$Global_active_power)), type = "l",  xlab = "", ylab = "Global Active Power (Kilowatts)")

dev.off()
