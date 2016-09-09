## UTF-8 with Latin Header
geo_read.csv("unicode/sample_UTF8-lat-header.csv")

## UTF-8 with Georgian header

## UTF-8 BOM with Latin Header
geo_read.csv("unicode/sample_UTF8-BOM-lat-header.csv",method="BOM")

## UTF-8 BOM with Georgian Header

## UTF-8 BOM with Latin Header and comma

## UTF-8 BOM with Latin Header and dates


## UCS-2LE BOM with Latin Header
geo_read.csv("unicode/sample_UCS-2LE-BOM-lat-header.csv",method="UCS-2LE")

## UCS-2LE BOM with Georgian Header
geo_read.csv("unicode/sample_UCS-2LE-BOM-geo-header.csv",method="UCS-2LE",trsheader=T)

## UCS-2LE BOM with Latin Header, date


## UCS-2LE BOM with Latin Header, date, comma
