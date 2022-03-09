#select one type
deal_with<-function(type0,j){
  
  #select all the films in this type
  Type_films <- dplyr::filter(X2021_2011_weeks_duplicated, type1==type0|type2==type0|type3==type0|type4==type0|type5==type0|type6==type0|type7==type0|type8==type0|type9==type0|type10==type0)
  Type_films <- dplyr::filter(Type_films, year==j)
  sum1<-0
  sum1<-sum(Type_films$`total gross`,na.rm=TRUE)
  return(sum1)
}

data2<-data.frame()
for(j in 2011:2021){
  data1<-data.frame()
  for(i in 1:18) 
  {
    data1<-rbind(data1,data.frame(typeframe[i,1],deal_with(typeframe[i,1],j)))
  data1
  } 
  data2<-rbind(data2,t(data1))
}

write.table( data2, file="C:/STAT2011/final matrial/filedata.txt")