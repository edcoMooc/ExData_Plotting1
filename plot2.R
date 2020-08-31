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

#Plot 2
png(file="C:/Users/olver/Documents/Edgar/DS/Coursera_JH/Project_1/plot2.png",
    width=480, height=480)

plot(seq(1, length(data_E$Global_active_power)), data_E$Global_active_power, 
     main = "Global Active Power",ylab = "Global Active Power (kilowatts)", 
     xlab = "", type = "l", xaxt = "n")

axis(1, at=c(0, nrow(subset(data_E, Date == "2007-02-01")),
             length(data_E$Global_active_power)), 
     labels=c("Thursday", "Friday", "Saturday"))

dev.off()