setwd("/Users/xuhao/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
datetime <- paste(df1$Date, df1$Time) # Now class(datetime) is "character" vector
df1$Datetime <- as.POSIXlt(datetime) # Add a new column to df1

png("plot3.png", width=480, height=480)
## When using dev.copy, the legend spacing was expanded.

with(df1, {
        plot(Datetime, Sub_metering_1, col="black", type="l",
             xlab="", ylab="Energy sub meeting")
        lines(Datetime, Sub_metering_2, col="red")
        lines(Datetime, Sub_metering_3, col="blue")
})
legend("topright", col=c("black","red","blue"), 
       lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
