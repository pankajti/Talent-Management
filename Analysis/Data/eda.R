library(tidyverse)
job_data=readxl::read_excel('./Analysis/Data/CaseStudy2-data.xlsx')


ggplot(data=job_data , aes(x=Attrition) )+
  geom_bar( mapping=aes( fill= BusinessTravel)) +
  geom_text(stat='count',aes(label=..count..), vjust=-1)
head(job_data)

names(job_data)


