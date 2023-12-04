library(tidyverse)
library("readxl")

Case_study=read_xlsx("C:\\Users\\DELL\\Downloads\\CASE STUDY\\2020_EXCEL\\2020_ALL.xlsx")
head(Case_study) 
Case_study1=read_xlsx("C:\\Users\\DELL\\Downloads\\CASE STUDY\\2020_EXCEL\\2020_ALL.xlsx",sheet='Sheet1')
Case_study2=read_xlsx("C:\\Users\\DELL\\Downloads\\CASE STUDY\\2020_EXCEL\\2020_ALL.xlsx",sheet='Sheet2')
Case_study3=read_xlsx("C:\\Users\\DELL\\Downloads\\CASE STUDY\\2020_EXCEL\\2020_ALL.xlsx",sheet='Sheet3')
Case_study=mutate(Case_study, ride_id = as.character(ride_id),rideable_type = as.character(rideable_type))
Case_study1=mutate(Case_study1, ride_id = as.character(ride_id),rideable_type = as.character(rideable_type))
Case_study2=mutate(Case_study2, ride_id = as.character(ride_id),rideable_type = as.character(rideable_type))
Case_study3=mutate(Case_study3, ride_id = as.character(ride_id),rideable_type = as.character(rideable_type))
all_trips <- bind_rows(Case_study,Case_study1,Case_study2,Case_study3)

# to get date,day,month and year of ride
all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

# to get ride time
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

# to convert character to numeric
is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))

#checking
is.numeric(all_trips$ride_length)

#removing redundant data as ride length can't be less than 0
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]

#getting starting and ending points of ride with location(latitue,longitude)
EndPoint=paste(all_trips_v2$end_lat, all_trips_v2$end_lng , sep= ",")
StartingPoint=paste(all_trips_v2$start_lat, all_trips_v2$start_lng, sep= ",")
all_trips_v2$EndPoint <- EndPoint
all_trips_v2$StartingPoint <- StartingPoint

#removing extra columns
all_trips_v2<- subset(all_trips_v2, select = -c(end_lat,end_lng,start_lat,start_lng))
file.exists("C:\\Users\\DELL\\Downloads\\CASE STUDY")
write.csv(all_trips_v2,"C:\\Users\\DELL\\Downloads\\CASE STUDY\\trip_20.csv",row.names=FALSE)


all_trips_v3 <- subset(all_trips_v2, select = -c(month,day,year))
file.exists("C:\\Users\\DELL\\Downloads\\CASE STUDY")
write.csv(all_trips_v3,"C:\\Users\\DELL\\Downloads\\CASE STUDY\\trip_20_tableau.csv",row.names=FALSE)


# STEP 4: CONDUCT DESCRIPTIVE ANALYSI
all_trips_v2=na.omit(all_trips_v2)
summary(all_trips_v2$ride_length)
mean(all_trips_v2$ride_length) #straight average (total ride length / rides)
median(all_trips_v2$ride_length) #midpoint number in the ascending array of ride lengths
max(all_trips_v2$ride_length) #longest ride
min(all_trips_v2$ride_length) #shortest ride

aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
med<-aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
maxx<-aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
minn<-aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)

counts <- aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)
file.exists("C:\\Users\\DELL\\Downloads\\CASE STUDY")
write.csv(counts,"C:\\Users\\DELL\\Downloads\\CASE STUDY\\Summary_20.csv",row.names=FALSE)
