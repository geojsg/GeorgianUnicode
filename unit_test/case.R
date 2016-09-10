#### READING CSV files

## UTF-8 with Latin Header
geo_read.csv("unicode/sample_UTF8-lat-header.csv")

## UTF-8 with Georgian header
geo_read.csv("unicode/sample_UTF8-geo-header.csv",trsheader=T)

## UTF-8 BOM with Latin Header
geo_read.csv("unicode/sample_UTF8-BOM-lat-header.csv",method="UTF-8-BOM")

## UTF-8 BOM with Georgian Header
geo_read.csv("unicode/sample_UTF8-BOM-geo-header.csv",method="UTF-8-BOM",trsheader=T)

## UTF-8 BOM with Latin Header and comma
geo_read.csv("unicode/sample_UTF8-BOM-lat-header-comma.csv",method="UTF-8-BOM")

## UCS-2LE BOM with Latin Header
geo_read.csv("unicode/sample_UCS-2LE-BOM-lat-header.csv",method="UCS-2LE")

## UCS-2LE BOM with Georgian Header
geo_read.csv("unicode/sample_UCS-2LE-BOM-geo-header.csv",method="UCS-2LE",trsheader=T)

#### WRITING CSV files

## Write a data frame without comma to CSV format
mydf<-geo_read.csv("unicode/sample_UTF8-BOM-lat-header.csv",method="UTF-8-BOM")
mydf$Date<-Sys.Date()
geo_write.csv(mydf,"unicode/output.csv")

## Write a data frame with comma to CSV format
mydf<-geo_read.csv("unicode/sample_UTF8-BOM-lat-header-comma.csv",method="UTF-8-BOM")
mydf$Date<-Sys.Date()
geo_write.csv(mydf,"unicode/output-comma.csv")
