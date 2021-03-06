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


##histrogram
png(filename="~/ExData_Plotting1/Plot1.png")
hist(ttt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()