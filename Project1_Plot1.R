setwd("C:/Users/curzimat/Documents/Stats/Exploratory_Data_Analysis/Project1")  ## My local working directory

## Read the data file
power <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

## Change Date column class from factor to date.
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

## Subset the dates required for the plot
pwrsubset <- subset(power, Date=="2007-02-01" | Date == "2007-02-02")

## Change the y-axis variable class from factor to numeric
pwrsubset$Global_active_power <- as.numeric(as.character(pwrsubset$Global_active_power))

## Create plot 1 in png device
png("Pr1_Plot1_mjc.png")
with(pwrsubset, hist(Global_active_power, col="red", 
main="Global Active Power",
xlab = "Global Active Power (kilowatts)"))
dev.off()
