library(tidyverse)
bookings=read.csv("C://Users//DELL//Desktop//R//hotel_bookings.csv")
head(bookings)                  
glimpse(bookings)
column_names=colnames(bookings)

#creating new dataframe with specific columns
new_dff<-select(bookings,"adr","adults")

library(dplyr)
new_df=mutate(new_df,total= adr / adults )

install.packages("janitor")
library(janitor)
#`arrange()`  automatically orders by ascending order, and you need to specifically tell it when to order by descending order,
ascending_order=arrange(bookings,lead_time)
bookings_2=arrange( bookings,desc(lead_time))

max_time=max(bookings$lead_time)                      
min_time=min(bookings$lead_time)
mean_time=mean(bookings$lead_time)

#average days booked in City Hotel
hotel=filter(bookings,bookings$hotel=="City Hotel")
City_Hotel_mean=mean(hotel$lead_time)

#summarize using pipe operator
hotel_summary=bookings%>%
  group_by(hotel)%>%
  summarise(average_time=mean(lead_time),
            min_time=min(lead_time),
            max_time=max(lead_time))

#for cleaning of data
install.packages("skimr")
library(skimr)

new_df=bookings
skimmed=skim_without_charts(new_df)

#creating new dataframe with specific columns
trimmed_df=new_df%>%
  select(hotel,is_canceled,lead_time)%>%
  rename(hotel_type=hotel)

#create a column with concating two column values
example_df=new_df%>%
  select(arrival_date_year,arrival_date_month)%>%
  unite(arrival_month_year,c("arrival_date_month","arrival_date_year"),sep=" ")

example_df2=new_df%>%
  mutate(guests=adults + children + babies)

summary2<- new_df%>%
  group_by(country)%>%
  summarise(cancelled=sum(is_canceled),
            average_time=mean(lead_time))

#total no.of cancelled bookings
summarise(new_df,cancelled=sum(is_canceled))
summarise(new_df,avg=mean(lead_time))

str(bookings)
