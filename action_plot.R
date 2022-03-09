install.packages("astsa")
library(astsa)

Adventure_films<-type_films("Adventure")
aAdventure<-c()
for(year1 in c(2011:2017,2020,2021))
{data1_Adventure<-dplyr::filter(Adventure_films,year==year1,1<=week,week<=13 )
data2_Adventure<-dplyr::filter(Adventure_films,year==year1,14<=week&week<=26 )
data3_Adventure<-dplyr::filter(Adventure_films,year==year1,27<=week,week<=39 )
data4_Adventure<-dplyr::filter(Adventure_films,year==year1,40<=week,week<=52 )

data1<-sum(data1_Adventure$`gross`,na.rm=TRUE)
data2<-sum(data2_Adventure$`gross`,na.rm=TRUE)
data3<-sum(data3_Adventure$`gross`,na.rm=TRUE)
data4<-sum(data4_Adventure$`gross`,na.rm=TRUE)
cat(data1," ",data2," ",data3," ",data4,"\n")
if(data1!=0) aAdventure<-c(aAdventure,data1)
if(data2!=0) aAdventure<-c(aAdventure,data2)
if(data3!=0) aAdventure<-c(aAdventure,data3)
if(data4!=0) aAdventure<-c(aAdventure,data4)
}
d2<-as.ts(aAdventure)
adventure_raw<-d2
plot(adventure_raw)

e1x2 <- ts(d1) #????????????
plot(d1, type="b") #????????????
acf(e1x2)
pacf(e1x2)
e1x2m = matrix(e1x2, ncol=4,byrow=TRUE)
action.col.means=apply(e1x2m,2,mean)
plot(action.col.means,type="b", main="Seasonly Means Plot for action", xlab="Season",
     ylab="Mean")
action=diff(e1x2,4)#???????????? s=4 ??????
plot(action)