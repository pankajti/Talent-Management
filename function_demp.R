library(tidyverse)

library(plyr)
job_data=readxl::read_excel(params$path)
job_data=job_data[job_data$Over18=='Y',]


draw_graph <- function(job_data, aa) {
  quo_group  <- sym(aa)
  business_travel_grouped_data=dplyr::group_by(job_data, !!quo_group, Attrition) %>%
    dplyr::summarise(count=n())  
  
  ce =ddply(business_travel_grouped_data , "Attrition" , 
            transform, percentage_weight = count/sum(count))
  
  graph <- ggplot(ce, aes(x=Attrition, y=percentage_weight, fill= !!quo_group))+
    geom_bar(stat="identity")
  geom_text((aes(label=percentage_weight)))
  graph
}


exploratory_fields = c("Education","EducationField","EnvironmentSatisfaction","Gender",
                       "JobInvolvement","JobLevel","JobRole","JobSatisfaction","MaritalStatus",
                       "MonthlyRate","NumCompaniesWorked","OverTime","PerformanceRating",
                       "RelationshipSatisfaction","StandardHours","StockOptionLevel",
                       "TotalWorkingYears","TrainingTimesLastYear","WorkLifeBalance"
                       ,"YearsAtCompany","YearsInCurrentRole","YearsSinceLastPromotion",
                       "YearsWithCurrManager")

for (field in exploratory_fields) {
  print(field)
  g=draw_graph(job_data,field)
  g
}

