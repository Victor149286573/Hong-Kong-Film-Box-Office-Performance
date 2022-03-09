install.packages("astsa")
library(astsa)

Action_films<-type_films("Action")
aAction<-c()
for(year1 in c(2011:2017,2020,2021))
{data1_Action<-dplyr::filter(Action_films,year==year1,1<=week,week<=13 )
data2_Action<-dplyr::filter(Action_films,year==year1,14<=week&week<=26 )
data3_Action<-dplyr::filter(Action_films,year==year1,27<=week,week<=39 )

data1<-sum(data1_Action$`gross`,na.rm=TRUE)
data2<-sum(data2_Action$`gross`,na.rm=TRUE)
data3<-sum(data3_Action$`gross`,na.rm=TRUE)
data4<-sum(data4_Action$`gross`,na.rm=TRUE)
cat(data1," ",data2," ",data3," ",data4,"\n")
if(data1!=0) aAction<-c(aAction,data1)
if(data2!=0) aAction<-c(aAction,data2)
if(data3!=0) aAction<-c(aAction,data3)
if(data4!=0) aAction<-c(aAction,data4)
}
d1<-as.ts(aAction)
action_raw<-d1
plot(action_raw)

e1x2 <- ts(d2) #????????????
plot(d2, type="b") #????????????
acf(e1x2)
pacf(e1x2)
e1x2m = matrix(e1x2, ncol=4,byrow=TRUE)
adventure.col.means=apply(e1x2m,2,mean)
plot(adventure.col.means,type="b", main="Seasonly Means Plot for adventure", xlab="Season",
     ylab="Mean")
adventure=diff(e1x2,4)#???????????? s=12 ??????
plot(adventure)



