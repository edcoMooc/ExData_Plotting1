# Import data
dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
# Date convertion
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

# Subset of data to work
data_E <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")



# Data Exploration
head(data_E)

#Plotting

#Plot 1
png(file="C:/Users/olver/Documents/Edgar/DS/Coursera_JH/Project_1/plot1.png",
    width=480, height=480)

hist(data_E$Global_active_power, col = 'red', main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()