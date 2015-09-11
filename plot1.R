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

#Creating the histogram of Global_active_power vs frequency
hist(as.numeric(filter_data$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#save hitogram in png format
dev.copy(png,file="plot1.png")
dev.off()