data("ToothGrowth")
View(ToothGrowth)
install.packages('dplyr')
library(dplyr)

filt=filter(ToothGrowth,dose==0.5)

arr=arrange(filt,len)
#nested 
arr2=arrange(filter(ToothGrowth,dose==0.5),len)

#pipe
pipe1=ToothGrowth %>%
  filter(dose==0.5)%>%
  arrange(len)

pipe2=ToothGrowth %>%
  filter(dose==0.5)%>%
  group_by(supp)%>%
  summarize(mean_len=mean(len,na.rm=T),.group="drop")
