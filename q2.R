library(httr)
install.packages("httr")
library(httr)
oauth_endpoints("github")

myapp = oauth_app("1github1", key = "632f7de21ed7c6a108a6", secret = "ebaef0568ae5b06904032f0c4f51d877d60f7117", redirect_uri = oauth_callback())
github_token = oauth1.0_token(oauth_endpoints("github"), myapp)
sign_config = config(token = github_token)

a = GET(url = "https://api.github.com/users/jtleek/repos", sign_config)
b = content(a)


str(b)
b[1]
b[[1]]
class(b)

library(jsonlite)

c = toJSON(b)
d = fromJSON(c)

names(d)

e = d[d$name == "datasharing"]
e = d[d$full_name == "datasharing", "created_at"]
e = d[d$full_name == "jtleek/datasharing", "created_at"]
e
## all the names are column names , hence while extracting the first
## command is used to isolate datasharing and the 2nd command
## is used to extract the column data for the isolated row
f = d[d$full_name == "jtleek/datasharing"]
f = d[d$full_name == "jtleek/datasharing", d$created_at]
f = d["full_name", "created_at"]
f = c(d$full_name,d$created_at)
f


install.packages("dplyr")
library(dplyr)

install.packages("data.table")
library(data.table)
d[47]

d[4]
d[18,47]



?GET
?config
?oauth_app
?oauth1.0_token

install.packages("sqldf")
library(sqldf)
library(curl)
getwd()
setwd("C:/Users/Siddhant Uchil/Desktop/R Studio/New folder")

g = download.file(url = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "q2.csv" )
?download.file

acs = read.csv("q2.csv")



  
  
sqldf("select * from acs where AGEP < 50")


sqldf("select * from acs")


sqldf("select pwgtp1 from acs")


sqldf("select pwgtp1 from acs where AGEP < 50")

dbConnect(acs)
?sqldf

sqldf(acs)


sqldf("select AGEP where unique from acs")


sqldf("select distinct pwgtp1 from acs")


sqldf("select distinct AGEP from acs")


sqldf("select unique * from acs")

p = url("http://biostat.jhsph.edu/~jleek/contact.html")
install.packages("XML")
install.packages("xml2")
install.packages("XML2R")

?readLines
q = readLines(p)

c(nchar(q[10]), nchar(q[20]), nchar(q[30]), nchar(q[100]))

library(XML)
r = htmlParse(q, asText = TRUE)
r

s = xmlRoot(r)
s
 ?cat

install.packages("htm2txt")
library(htm2txt)
t = gettxt(p)
t
?gettxt

txt <- xpathApply(r, "//body//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)]", xmlValue)
cat(unlist(txt))
nchar(cat(unlist(txt)))

?read.fwf

install.packages("readr")
library(readr)

l = read_fwf("1.for", skip = 4 , fwf_widths(c(12,7,4,9,4,9,4,9,4)))

l
sum(l[,4])

?read_fwf


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n = 10)
v <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", 
              "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", 
              "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")
z <- read.fwf(url, v, header = FALSE, skip = 4, col.names = colNames)
z <- z[, grep("^[^filler]", names(z))]
sum(z[, 4])
z




