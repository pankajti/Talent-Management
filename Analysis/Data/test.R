test=data_frame(name=c("pankaj", "deepak", "aa", "bb","dd") , 
                weight= c(67,70,70,71,70), height=c(169,172,199,199,34))
test


ggplot(data=test)+
  geom_bar(mapping= aes(y=height, x= weight), stat="identity")