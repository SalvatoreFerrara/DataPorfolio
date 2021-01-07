
library(hash)
column<-select(X2020_INDAGINE_MASTER_2015_2019, 3)

diz <- hash()
for (i in 1:dim(column)[1]){
  current = toString(column[i,1])
  #print(column[i,1])
  if(is.null(diz[[current]])){
    diz[[current]] <- 1
  }else{
    value = diz[[current]]
    diz[[current]] = value+1
  }
}

total = diz[["2015"]] +  diz[["2016"]] + diz[["2017"]] + diz[["2018"]] + diz[["2019"]] 
vec <-  c(as.integer((diz[["2015"]]/total)*100),as.integer((diz[["2016"]]/total)*100),as.integer((diz[["2017"]]/total)*100),as.integer((diz[["2018"]]/total)*100),as.integer((diz[["2019"]]/total)*100));



library(plotrix)
lbls <- c("2015", "2016", "2017", "2018", "2019")

pie3D(vec,labels=lbls,explode=0.1,
      main="Pie Chart of completed Master ")

