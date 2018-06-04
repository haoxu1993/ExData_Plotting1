setwd("/Users/xuhao/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")

datetime <- paste(df1$Date, df1$Time) # Now class(datetime) is "character" vector
df1$Datetime <- as.POSIXlt(datetime) # Add a new column to df1
with(df1, {
        plot(Datetime, Global_active_power, type="l", 
             xlab="", ylab="Global Active Power (kilowatts)")
})

dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()
