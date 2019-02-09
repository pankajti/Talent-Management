library(tidyverse)
job_data=readxl::read_excel('./Analysis/Data/CaseStudy2-data.xlsx')


ggplot(data=job_data , aes(x=Attrition) )+
  geom_bar( mapping=aes( fill= BusinessTravel)) +
  geom_text(stat='count',aes(label=..count..), position = position_stack(vjust=.5), vjust=-1)
head(job_data)


p = ggplot(data=job_data , aes(x=Attrition) )

ggplot(data=job_data)+
  geom_bar(mapping=aes(x= JobInvolvement, y= MonthlyIncome , fill= Gender), 
           stat="identity")

ggplot(data=job_data)+
  geom_bar(mapping=aes(x= JobRole, y= MonthlyIncome , fill= Gender), 
           stat="identity")+
  theme(axis.text.x = element_text(angle = 90) )


ggplot(data=job_data)+
  geom_bar(mapping=aes(x= MaritalStatus, y= MonthlyIncome , fill= Gender), 
           stat="identity")+
  theme(axis.text.x = element_text(angle = 90) )



names(job_data)

p+geom_bar(mapping=aes(  fill=Gender), stat = "count")

attrition_data= job_data[job_data$Attrition=="Yes",]
non_attrition_data= job_data[job_data$Attrition=="No",]

ggplot(data=attrition_data)+
  geom_bar(mapping=aes(x= JobInvolvement , fill= Gender), 
           stat="count")+
  theme(axis.text.x = element_text(angle = 90) )


ggplot(data=non_attrition_data)+
  geom_bar(mapping=aes(x= JobInvolvement , fill= Gender), 
           stat="count")+
  theme(axis.text.x = element_text(angle = 90) )

p+geom_bar()

## check % of male vs female who did attrition

grouped_data=group_by(job_data, Gender, Attrition) %>%
  summarise(count=n()) %>%
  mutate(perc= count)

library(plyr)

# check impact of gender 
ce =ddply(grouped_data , "Attrition" , 
      transform, percentage_weight = count/sum(count))

ggplot(ce, aes(x=Attrition, y=percentage_weight, fill= Gender))+
  geom_bar(stat="identity")

job_involvement_grouped_data=dplyr::group_by(job_data, JobInvolvement, Attrition) %>%
  dplyr::summarise(count=n())  

# check impact of JobInvolvement 


ce =ddply(grouped_data , "Attrition" , 
          transform, percentage_weight = count/sum(count))

ggplot(ce, aes(x=Attrition, y=percentage_weight, fill= JobInvolvement))+
  geom_bar(stat="identity")
  geom_text((aes(label=percentage_weight)))
  

  
  # check impact of business travel 

business_travel_grouped_data=dplyr::group_by(job_data, BusinessTravel, Attrition) %>%
    dplyr::summarise(count=n())  
  
  
  ce =ddply(business_travel_grouped_data , "Attrition" , 
            transform, percentage_weight = count/sum(count))
  
  ggplot(ce, aes(x=Attrition, y=percentage_weight, fill= BusinessTravel))+
    geom_bar(stat="identity")
  geom_text((aes(label=percentage_weight)))

