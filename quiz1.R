getwd()
setwd("C:/Users/Siddhant Uchil/Desktop/R Studio/New folder")
getwd()
k = download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "data.csv", method = "curl")
j = read.csv("data.csv")
library(data.table)
m = data.table(j)
names(m)
m[,.N,by = "VAL"]

library(xlsx)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "data.xlsx", method = "curl")
dat = read.xlsx(file = "data.xlsx", sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23)

dat = data.table(dat)
names(dat)
sum(dat$Zip*dat$Ext,na.rm=T)

library(XML)
library(RCurl)
fileurl = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc = xmlTreeParse(fileurl, useInternalNodes = TRUE)
topNode = xmlRoot(doc)
?do.call
class(topNode)
xmlName(topNode)

els = getNodeSet(topNode, "//row")
class(els)

els[[1]][[]]

class(xmlSApply(els, function(x)xmlSApply(x, xmlValue)))

test = xpathSApply(els[[1]], "//zipcode", xmlValue)

class(test)
test

length(test)
i = 1
count = 1
for(i in  1:length(test))
{
  if(test[i] == "21231")
  {
    count = count + 1
  } 
  i = i + 1
  
}
count
test = as.vector(test)
library(data.table)
DT = fread("1.csv")




#broken down by sex. Using the data.table package, which will deliver the fastest user time?
  
  
  tapply(DT$pwgtp15,DT$SEX,mean)


rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]


mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)


sapply(split(DT$pwgtp15,DT$SEX),mean)


mean(DT$pwgtp15,by=DT$SEX)


DT[,mean(pwgtp15),by=SEX]



