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

## Change the y-axis variable class from factor to numeric
pwrsubset$Global_active_power <- as.numeric(as.character(pwrsubset$Global_active_power))

## Create plot 2 in png device
png("Pr1_Plot2_mjc.png")
plot(pwrsubset$date_time, pwrsubset$Global_active_power, type="l", 
ylab="Global Active Power (kilowatts)", xlab="")
dev.off()