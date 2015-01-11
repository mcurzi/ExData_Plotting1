setwd("C:/Users/curzimat/Documents/Stats/Exploratory_Data_Analysis/Project1")  ## My local working directory

## Read the data file
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

## Change Date column class from factor to date.
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the dates required for the plot
pwrsubset <- subset(power, Date=="2007-02-01" | Date == "2007-02-02")

## Create a date+time variable to use as the x-axis in the plot
pwrsubset$date_time <- paste (pwrsubset$Date, pwrsubset$Time)
pwrsubset$date_time <- strptime(pwrsubset$date_time, "%Y-%m-%d %H:%M:%S")

## Change the y-axis variables from class factor to numeric
pwrsubset$Sub_metering_1 <- as.numeric(as.character(pwrsubset$Sub_metering_1))
pwrsubset$Sub_metering_2 <- as.numeric(as.character(pwrsubset$Sub_metering_2))
pwrsubset$Sub_metering_3 <- as.numeric(as.character(pwrsubset$Sub_metering_3))


## Create plot 3 in png device
png("Pr1_Plot3_mjc.png")
with(pwrsubset, plot(date_time, Sub_metering_1, type="n", 
ylab="Energy sub metering", xlab=""))
with(pwrsubset, lines(date_time, Sub_metering_1))
with(pwrsubset, lines(date_time, Sub_metering_2, col="red"))
with(pwrsubset, lines(date_time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black" ,"blue", "red"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()