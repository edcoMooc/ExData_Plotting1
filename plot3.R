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

#Plot3

png(file="C:/Users/olver/Documents/Edgar/DS/Coursera_JH/Project_1/plot3.png",
    width=480, height=480)

par(mfrow = c(1,1))

plot(seq(1, length(data_E$Global_active_power)), data_E$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab = "", type = "l", xaxt = "n")

lines(seq(1, length(data_E$Global_active_power)), data_E$Sub_metering_2, 
      xlab = "", type = "l", xaxt = "n", col = "red")

lines(seq(1, length(data_E$Global_active_power)), data_E$Sub_metering_3,
      xlab = "", type = "l", xaxt = "n", col = "blue")

axis(1, at=c(0, nrow(subset(data_E, Date == "2007-02-01")),
             length(data_E$Global_active_power)), 
     labels=c("Thursday", "Friday", "Saturday"))

legend("topright", lty = 1, pt.cex = 10,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), cex = .5, text.width = 600)

dev.off()