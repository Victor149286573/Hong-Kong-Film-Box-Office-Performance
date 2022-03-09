install.packages("tidyverse")
install.packages("dplyr")
install.packages("stringr")
install.packages("plotrix")

library(readxl)
library(stringr)
library(tidyverse)
library(magrittr)
library(plotrix)
library(dplyr)

library(tidyverse)      # data manipulation and visualization
library(lubridate)      # easily work with dates and times
library(fpp2)           # working with time series data
library(zoo)            # working with time series data
#read_table
X2021_2011_weeks<- read_excel("C:/STAT2011/final material/2021-2011_weeks.xlsx", 
                              sheet = "Sheet1 (2)", col_types = c("numeric", 
                                                                  "numeric", "text", "text", "text", 
                                                                  "text", "text", "text", "text","text", "text",
                                                                  "text", "text", "numeric", 
                                                                  "numeric", "numeric","numeric","numeric","numeric", 
                                                                  "numeric", "text"))

View(X2021_2011_weeks)



#duplicate
X2021_2011_weeks_duplicated<- X2021_2011_weeks[!duplicated(X2021_2011_weeks$me,fromLast = TRUE),]

#typetable
typetable<-table(c(X2021_2011_weeks_duplicated$type1,X2021_2011_weeks_duplicated$type2,X2021_2011_weeks_duplicated$type3,X2021_2011_weeks_duplicated$type4,X2021_2011_weeks_duplicated$type5,X2021_2011_weeks_duplicated$type6,X2021_2011_weeks_duplicated$type7,X2021_2011_weeks_duplicated$type8,X2021_2011_weeks_duplicated$type9,X2021_2011_weeks_duplicated$type10))

#type selection
typetable<-typetable[typetable>40]

#typeframe
typeframe<-as.data.frame(typetable)

#select top 18 according to moive numbers
typeframe<-typeframe[order(typeframe[[2]],decreasing= TRUE)[1:18],]

type_films<-function(type0){
  Type_films <- dplyr::filter(X2021_2011_weeks, type1==type0|type2==type0|type3==type0|type4==type0|type5==type0|type6==type0|type7==type0|type8==type0|type9==type0|type10==type0)
  return(Type_films)
}




