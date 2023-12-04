#creates a folder in present directory
dir.create ("destination_folder")

#creates a file in present directory
file.create ("new_text_file.txt") 
d1=data.frame(name=c("bhagya","anil","Kiran"),age=c(21,17,19))
write.table(d1,file="new_text_file.txt")


file.create ("new_csv_file.csv")
Id<-c(671,705,716,538,461)
Name<-c("Bhagyasri","Prathyusha","Manisha","Abhishek","Kiran Kumar")
Salary<-c("25k","34k","41k","25k","50k")
Role<-c("Data Analyst","Research Developer","Verification Engineer","Verification Engineer","Embedded Engineer")
Location<-c("Vijayawada","Hyderabad","Bangalore","Bangalore","Bangalore")
df<-data.frame(Id,Name,Salary,Role,Location)
write.csv(df,file="new_csv_file.csv",row.names = FALSE)

file.copy ("new_text_file.txt" , "destination_folder")
file.copy ("new_csv_file.csv" , "destination_folder")

file.create ("new_word_file.docx") 

m1=matrix(c(3:8), nrow = 3)
m2=matrix(c(2,3,4,5,3,4,2,2),ncol=3)
m3=matrix(c(2,1,4,2,3,4,1,3),ncol=3)
m4=m2*m3
#matrix multiplication
m5=m2%*%m3



id <- c(1:10)

name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)

p1=separate(employee,name,into=c("First_Name","Last_Name"),sep=" ")

unite(p1,"Name",First_Name,Last_Name,sep=" ")

