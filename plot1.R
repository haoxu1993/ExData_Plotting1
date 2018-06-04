setwd("/Users/xuhao/Desktop/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df1 <- subset(df, Date=="1/2/2007" | Date=="2/2/2007")
df1$Date <- as.Date(df1$Date, "%d/%m/%Y")
hist(df1$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

