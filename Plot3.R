##inefficient but effective data import

##read entire data set

pdata <- read.table("~/ExData_Plotting1/household_power_consumption.txt", header= TRUE, sep = ";",na.strings = "?")

##convert data column format
t <- as.Date(pdata$Date, "%d/%m/%Y")
##combine time and data into POSitX format
tt<-strptime(paste(pdata$Date, pdata$Time), format="%d/%m/%Y %H:%M:%S")
##add combined to data frame
qdata<-cbind(tt, pdata)
##substitute formatted data column
qdata$Date<-t
#select dates
ttt<-subset(qdata, tt<strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")&
                    tt>strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S"))


#create plot
png(filename="~/ExData_Plotting1/Plot3.png")
plot(ttt$Sub_metering_1~ ttt$tt, type="l", xlab="", ylab="Energy sub metering")
lines(ttt$Sub_metering_2~ ttt$tt, col="red")
lines(ttt$Sub_metering_3~ ttt$tt, col="blue")

legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), cex=1.0)

dev.off()