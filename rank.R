library(data.table)
library(haven)
library(readr)
library(readxl)
library(dplyr)

### 1. Read data
data_gross <- read.csv("Documents/yr2 term2/STAT2011/rank_gross.csv")
data_gross <- setDT(data_gross)

data_rank <- read_excel("Documents/yr2 term2/STAT2011/rank.xls")
data_rank <- setDT(data_rank)
### 2. Connect two data tables
join<-left_join(data_gross, data_rank, by = c('name' = 'Movies'))

### 3. Regression
plot(join[,rank.x], join[,rank.y], xlab='rank of total_gross', ylab='rank of online time')
fit<-lm(join[,rank.y]~join[,rank.x])
abline(fit, col='blue')
# p-value=0.2294>0.05, therefore, we don't reject H0 at a=0.05. 
# So the rank of total gross and rank of online time are linear independnt.
anova(fit)