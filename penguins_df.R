install.packages("here")
library("here")
install.packages("skimr")
library("skimr")
install.packages("janitor")
library('janitor')
install.packages("dplyr")
library("dplyr")
install.packages("palmerpenguins")
library("palmerpenguins")
install.packages("tidyr")
library('tidyr')
df<-data.frame(penguins)

# to get the summary of data, we use head(),glimpse(),select() & skim_without_charts()
skim_without_charts(penguins)

#to get only one column or exclude one or more column
pipe1=penguins%>%
  select(species)

pipe2=penguins%>%
  select(-species,-sex)

#to change column names we use rename()
penguins<-rename_with(penguins,toupper)
penguins<-rename_with(penguins,tolower)

#sorting
penguins%>%
  arrange(bill_length_mm)

penguins2=penguins%>%
  arrange(-bill_length_mm)

#summarise
summary1<-penguins%>%
  group_by(species,island)%>%
  #drop_na is in tidyr package and all other are in dplyr
  drop_na()%>%
  summarize(max_beak_length=max(bill_length_mm),min_beak_length=min(bill_length_mm),mean_beak_lenght=mean(bill_length_mm))

summary2<-penguins%>%
  group_by(island,species)%>%
  drop_na()%>%
  summarise(max_beak_length=max(bill_length_mm),min_beak_length=min(bill_length_mm),mean_beak_lenght=mean(bill_length_mm))

#filter
filter1=penguins%>%
  filter(species=="Adelie",island=="Dream")

body_mass=penguins%>%
  mutate(body_mass_kg=body_mass_g/1000,flipper_lenthg_cm=flipper_length_mm/100)
