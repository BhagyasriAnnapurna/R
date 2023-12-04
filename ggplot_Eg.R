df<-data.frame(penguins)
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species))
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species,shape=species,size=species))
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,alpha=species))
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g),color="turquoise")

#different plots
ggplot(df)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))
ggplot(df)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g))
ggplot(df)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,linetype=species))

ggplot(df)+geom_jitter(mapping=aes(x=flipper_length_mm,y=body_mass_g))

df2=data.frame(diamonds)
ggplot(df2)+geom_bar(mapping=aes(x=cut))
ggplot(df2)+geom_bar(mapping=aes(x=cut,color=cut))
ggplot(df2)+geom_bar(mapping=aes(x=cut,fill=clarity))


#facet function
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_grid(sex~species)

#title
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins:Body Mass VS Flipper Length")
#subtitle
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins:Body Mass VS Flipper Length",subtitle = "Samples of 3 Species")
#Caption
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins:Body Mass VS Flipper Length",subtitle = "Samples of 3 Species",
       caption="Data collected by Dr.Kristen Gorman")
#annotate
ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins:Body Mass VS Flipper Length",subtitle = "Samples of 3 Species",
       caption="Data collected by Dr.Kristen Gorman")+
  annotate("text",x=220,y=3500,label="Gentoos are the largest",color="navyblue",fontface="italic",size=3.5)

ggplot(df)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins:Body Mass VS Flipper Length",subtitle = "Samples of 3 Species",
       caption="Data collected by Dr.Kristen Gorman")+
  annotate("text",x=220,y=3500,label="Gentoos are the largest",color="darkgreen",fontface="bold",size=3.5,angle=30)
#tosave
ggsave("Palmer Penguins_final.PNG")
