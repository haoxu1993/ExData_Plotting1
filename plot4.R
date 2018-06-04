setwd("/Users/xuhao/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
datetime <- paste(df1$Date, df1$Time) # Now class(datetime) is "character" vector
df1$Datetime <- as.POSIXlt(datetime) # Add a new column to df1

png("plot4.png", width=480, height=480) # Use this to avoid torsion.

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(df1,{
        plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(Datetime, Sub_metering_1, col="black", type="l",
             xlab="", ylab="Energy sub meeting")
        lines(Datetime, Sub_metering_2, col="red")
        lines(Datetime, Sub_metering_3, col="blue")
        legend("topright", col=c("black","red","blue"), lty=1, lwd=2, bty = "n", 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Datetime, Global_reactive_power, type="l", xlab="datetime")
})

## dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()
