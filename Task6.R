
library(hash)
library(tidyverse)
library(plotrix)
column<-select(X2020_INDAGINE_MASTER_2015_2019, 4)

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

column<-select(X2020_INDAGINE_MASTER_2015_2019, 5)

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

column<-select(X2018_Indagine_laureati_2013, 4)

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

