## Handling CSV files with Georgian (unicode) characters

### File encoding

CSV format is not a so basic text format. It exists several encodings supporting Georgian characters (e.g UTF8, UTF8-BOM, UCS-2LE).  
First, it is important to identify in which encoding is your file.  For that, the best option is to use [Notepad++](https://notepad-plus-plus.org/download).  



*Note*: with MS Excel, when saving a xlsx format file with Georgian characters to CSV format, Georgian characters are replaced with '?' because it is not supported.  
For that, I advise to use [this Excel add-in](https://jaimonmathew.wordpress.com/2011/08/23/excel_addin_to_work_with_unicode_csv/)


### Reading & writing CSV files with R  

Loading the file geo_csv.R : source(geo_csv.R)
  
#### Reading CSV file  

Function geo_read.csv, a wrapper to the read.csv function with following parameters:
- file : CSV file to load
- skip=0 by default (to skip number of first line in csv file)
- header=T by default (if the table in the csv file has header / column names or not)
- method="UTF-8" by default (see below for chosig the method / encoding)
- colclass="character" by default and recommended (then 
- trsheader=F by default, i.e. if there is header, there are in latin character. But if not, then the loading of the table will work only if the headers are transliterated in latin characters, setting: trsheader=T  

Encodings supported :
- UTF8 (method="UTF-8")
- UTF8-BOM (method="UTF-8-BOM")
- UCS-2LE (method="UCS-2LE")

See examples on in the files unit_test/case.R

#### Writing CSV file  

Function geo_write.csv(mydataframe, filename) is writing a CSV file as binary file:
- mydataframe must be a data.frame
- filename : path and filename where the dataframe will be saved.

Output: CSV file encoded in UTF8-BOM (so that Georgian unicode character can be read with MS Excel)

Considerations:
- geo_write.csv is NOT a wrapper to the write.csv file as it is writing a binary file (in order to save unicode characters)
- if there is any comma in one of the fields, then fields will be saved between "". For example: "a,b","b" 


## Important 

These functions have not the ambition to solve all problem with Georgian characters.
It was created to solve the encountered problems of encodings related to Georgian unicode characters.
Feel free to take part in improving these functions and/or to report bugs.




