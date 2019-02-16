library(tidyverse)
library(plyr)
job_data=readxl::read_excel('Analysis/Data/CaseStudy2-data.xlsx')
job_data=job_data[job_data$Over18=='Y',]

ggplot(job_data, aes(x=MonthlyIncome, fill = Attrition))+ geom_histogram(binwidth = 30)


ggplot(job_data, aes(x=MonthlyIncome, fill = Attrition))+ geom_density()

ggplot(job_data, aes(x=YearsSinceLastPromotion, fill = Attrition))+ geom_density()

ggplot(job_data, aes(x=YearsSinceLastPromotion, fill = Attrition))+ geom_histogram(binwidth = 1)


ggplot(job_data, aes(x=HourlyRate, y= ..density.. , fill = Attrition))+ geom_histogram(binwidth = 3)+
  geom_density(mapping= aes(fill= Attrition))


ggplot(job_data, aes(x=YearsSinceLastPromotion, y= ..density.. , fill = Attrition))+ geom_histogram(binwidth = 3)+
  geom_density(mapping= aes(fill= Attrition))

ggplot(job_data, aes(y=YearsSinceLastPromotion, x = Attrition))+ geom_boxplot()


ggplot(job_data, aes(y=MonthlyIncome, x = Attrition))+ geom_boxplot()


ggplot(job_data, aes(y=HourlyRate, x = Attrition))+ geom_boxplot()

ggplot(job_data, aes(y=MonthlyRate, x = Attrition))+ geom_boxplot()

ggplot(job_data, aes(y=DailyRate, x = Attrition))+ geom_boxplot()

ggplot(job_data, aes(y=PercentSalaryHike, x = Attrition))+ geom_boxplot()

ggplot(job_data, aes(y=TotalWorkingYears, x = Attrition))+ geom_boxplot()
ggplot(job_data, aes(y=PercentSalaryHike, x = Attrition))+ geom_boxplot()
ggplot(job_data, aes(y=PercentSalaryHike, x = Attrition))+ geom_boxplot()









