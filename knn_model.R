library(gmodels)

library(tidyverse)
library(class)
job_data=readxl::read_excel('./Analysis/Data/CaseStudy2-data.xlsx')
 
job_data$dept.sales= ifelse (job_data$Department=='Sales' ,1 ,0)
job_data$dept.hr= ifelse (job_data$Department=='Human Resources' ,1 ,0)
job_data$dept.rd= ifelse (job_data$Department=='Research & Development' ,1 ,0)
job_data$gender.m= ifelse (job_data$Gender=='Male' ,1 ,0)
job_data$bt.tr= ifelse (job_data$BusinessTravel=='Travel_Rarely' ,1 ,0)
job_data$bt.tf= ifelse (job_data$BusinessTravel=='Travel_Frequently' ,1 ,0)
job_data$bt.nt= ifelse (job_data$BusinessTravel=='Non-Travel' ,1 ,0)
job_data$ms.d= ifelse (job_data$MaritalStatus=='Divorced' ,1 ,0)
job_data$ms.m= ifelse (job_data$MaritalStatus=='Married' ,1 ,0)
job_data$ot= ifelse (job_data$OverTime=='Yes' ,1 ,0)

job_data$hrep= ifelse (job_data$OverTime=='Healthcare Representative' ,1 ,0)
job_data$hr= ifelse (job_data$JobRole=='Humar Resource' ,1 ,0)
job_data$lt= ifelse (job_data$JobRole=='Laboratory Technician' ,1 ,0)
job_data$mr= ifelse (job_data$JobRole=='Manager' ,1 ,0)
job_data$md= ifelse (job_data$JobRole=='Manufacturing Director' ,1 ,0)
job_data$rd= ifelse (job_data$JobRole=='Research Director' ,1 ,0)
job_data$rs= ifelse (job_data$JobRole=='Research Scientist' ,1 ,0)
job_data$sr= ifelse (job_data$JobRole=='Sales Representative' ,1 ,0)
job_data$se= ifelse (job_data$JobRole=='Sales Executive' ,1 ,0)

job_roles= c('hrep' , 'hr','lt','mr','md','rs','rd','sr','se')
 features= c('Age', 'JobSatisfaction', 'MonthlyIncome' ,   'StockOptionLevel'
             ,'DistanceFromHome','JobLevel' ,'YearsAtCompany',
             'TotalWorkingYears' ,'YearsWithCurrManager'
            )
 #features=append(features,job_roles)
outcome= c('Attrition')

job_data_ana=job_data[append(features,outcome)]
job_data_ana =normalizeFeatures(job_data_ana )


job_data_train = job_data_ana[1:(1470*.6),]
job_data_test = job_data_ana[((1470*.6)+1):1470,]

classifier=knn(job_data_train[features], 
               job_data_test[features] , 
               cl= job_data_train$Attrition
               , k=3)
 

CrossTable( as.character(job_data_test$Attrition), classifier,
             prop.chisq=FALSE)