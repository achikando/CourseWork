run_analysis = function()
{
  ## dowload data set and unzip into local directory 
  library(dplyr)
  if(!file.exists("./courseProject")){dir.create("./courseProject")}
  fUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fUrl, destfile="./courseProject/uci",method="curl")
  ## extract folder "UCI HAR Dataset"
  setwd("./courseProject")  ##reset working directory
  unzip("uci") 

  
  ## Assemble training dataset
  yval = read.table("./UCI HAR Dataset/train/y_train.txt")
  xval = read.table("./UCI HAR Dataset/train/X_train.txt")
  subj = read.table("./UCI HAR Dataset/train/subject_train.txt")
  trainData = mutate(xval, activity=yval$V1, subject_id=subj$V1)
  
  ## Assemble test dataset
  yval = read.table("./UCI HAR Dataset/test/y_test.txt")
  xval = read.table("./UCI HAR Dataset/test/X_test.txt")
  subj = read.table("./UCI HAR Dataset/test/subject_test.txt")
  testData = mutate(xval, activity=yval$V1, subject_id=subj$V1)
  
  ##combine 2 datasets into 1 
  names(testData) = names(trainData)
  DatSet = rbind(testData,trainData)
  
  #computing measurement mean and standard dev
  library(data.table)
  DatSet = as.data.table(DatSet)
  MMeans = DatSet[, lapply(.SD, mean), by=activity]
  MstdDev = DatSet[, lapply(.SD, sd), by=activity]
  
  ## incorporating activity names
  activityName = c('walking','walkingUp', 'walkingDown', 'sitting', 'standing', 'laying')
  tmp = DatSet$activity
  hldr = c()
  for(i in 1:length(tmp))
  {
    hldr[i] = activityName[tmp[i]]
  }
  hldr = matrix(hldr, nrow = length(tmp), ncol = 1)
  hldr = data.frame(hldr)
  names(hldr) = "Activity_name"
  DatSet = cbind(DatSet,hldr)
  
  ## subsetting and reshaping data to get tidyData
  Measures_name = names(xval)
  flg = TRUE
  
  for(i in 1:length(activityName))
  {
    tmp = DatSet[DatSet$Activity_name==activityName[i],]
    a = c(activityName[i])
    tmp = as.data.table(tmp)
    tmpMelt = melt(tmp, id=c("subject_id","activity","Activity_name"), measure.vars = Measures_name)
    tmpcast = dcast(tmpMelt, subject_id~variable, mean)
    
    tp = matrix(a, nrow = 30, ncol = 1)
    tp = data.frame(tp)
    names(tp) = "Activity_name"
    tmpcast = cbind(tmpcast,tp)
    if(flg==TRUE)
    {
      tidyData = tmpcast
      flg = FALSE
    }else{
      tidyData = rbind(tidyData,tmpcast)
    }
  }
  
  write.csv(tidyData,'Tidydata.csv')
}

