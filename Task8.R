
library(hash)
library(tidyverse)
library(plotrix)
column<-select(X2020_INDAGINE_MASTER_2015_2019, 22)

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



