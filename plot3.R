#Loading the Data from the file
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

#Filterint out the required data
filter_data<-mydata[mydata$Date=='1/2/2007'|mydata$Date=='2/2/2007',]

#Converting the Date field to Date format
filter_data$Date<-as.Date(filter_data$Date,"%d/%m/%Y")

#Merged the date and time field in time field
filter_data$Time<-interaction(filter_data[,1],filter_data[,2],sep=" ")

#Convert the time field into Time class
filter_data$Time<-strptime(filter_data$Time,"%Y-%m-%d %H:%M:%S")

#Creating the line graph of Global_active_power vs time
plot(filter_data$Time,filter_data$Sub_metering_1,type="n",xlab="Day",ylab="Energy sub metering")
lines(filter_data$Time,filter_data$Sub_metering_1,type="S",col="black")
lines(filter_data$Time,filter_data$Sub_metering_2,type="S",col="red")
lines(filter_data$Time,filter_data$Sub_metering_3,type="S",col="blue")


#save hitogram in png format
dev.copy(png,file="plot3.png")
dev.off()