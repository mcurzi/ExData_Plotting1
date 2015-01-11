setwd("C:/Users/curzimat/Documents/Stats/Exploratory_Data_Analysis/Project1")  ## My local working directory

## Read the data file
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

## Change Date column class from factor to date.
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the dates required for the plot
pwrsubset <- subset(power, Date=="2007-02-01" | Date == "2007-02-02")

## Create a date+time variable to use as the x-axis in the plot
pwrsubset$datetime <- paste (pwrsubset$Date, pwrsubset$Time)
pwrsubset$datetime <- strptime(pwrsubset$datetime, "%Y-%m-%d %H:%M:%S")

## Change the y-axis variables from class factor to numeric
pwrsubset$Global_active_power <- as.numeric(as.character(pwrsubset$Global_active_power))
pwrsubset$Sub_metering_1 <- as.numeric(as.character(pwrsubset$Sub_metering_1))
pwrsubset$Sub_metering_2 <- as.numeric(as.character(pwrsubset$Sub_metering_2))
pwrsubset$Sub_metering_3 <- as.numeric(as.character(pwrsubset$Sub_metering_3))
pwrsubset$Global_reactive_power <- as.numeric(as.character(pwrsubset$Global_reactive_power))
pwrsubset$Voltage <- as.numeric(as.character(pwrsubset$Voltage))


### Create plot 4 in png device ###
png("Pr1_Plot4_mjc.png")
par(mfcol = c(2, 2))

## Upper-left figure 
plot(pwrsubset$datetime, pwrsubset$Global_active_power, type="l", 
ylab="Global Active Power", xlab="")

## Lower-left figure 
with(pwrsubset, plot(datetime, Sub_metering_1, type="n", 
ylab="Energy sub metering", xlab=""))
with(pwrsubset, lines(datetime, Sub_metering_1))
with(pwrsubset, lines(datetime, Sub_metering_2, col="red"))
with(pwrsubset, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n", col = c("black" ,"blue", "red"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Upper-right figure 
with(pwrsubset, plot(datetime, Voltage, type="l"))

## Lower-right figure 
with(pwrsubset,plot(datetime, Global_reactive_power, type="l"))

dev.off()

