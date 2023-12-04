a<-"bhagya"
b<-9.45
a="anil"
v=c(12.4,2,45,789)
class(a)
class(b)
typeof(v)
names(v)
is.numeric(v)
length(v)
d=c('bhag','milka','bhag')
names(d)=c(1,2,3)
l=list(34,3L,"sucks",TRUE)
str(l)
li=list(list(list(2,4,5,767,5)))
str(li)
list('bhagya'=1,"anil"=2,"jimmy"=3)
x=today()
y=now()
z=mdy("february 20th,2001")
z2=ymd("20020430")
z3=ymd("2002-may-30")
z4=as_date(now())

#ARITHMETIC OPERATORS
x=16
y=3
#modulus (returns remainder)
x%%y
#return integer division 
x%/%y
#returns division
x/y

#RELATIONAL OPERATOR
x>y
x==y
x<=y
x!=y

#LOGICAL OPERATOR

x>4 & y>6
x>6 & y>2
x>6 && y>2
x>6 & x<18
x<3 | y<2
x<3 | y>2
