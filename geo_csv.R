### READ CSV UNICODE WITH GEORGIAN CHARACTERS
geo_read.csv<-function(f,skip=0,header=T,method="UT8",colclass="character",trsheader=F) {
	if (method=="UT8" | method=="BOM") {
    table<-read.csv(f, encoding="UTF-8",skip=skip,header=header,colClasses=colclass)
  	if(method=="BOM")	names(table)[1]<-substring(names(table)[1],10)
	}
  else {
    A <- readLines(con <- file(f, encoding = "UCS-2LE"))
    if(header) 
      {
        table<-read.table(text = A[-1], sep = ",")
        colnames<-strsplit(A[1],",")
        if (trsheader) {
          ## translate header and keep only alphanumeric character
          library(stringi)
          names(table)<-lapply(colnames, function(x) gsub("[^A-Za-z0-9]","",stri_trans_general(x,"Georgian-Latin/BGN")))[[1]]
          } else names(table)<-colnames[[1]]
        
    }
    else table<-read.table(text = A, sep = ",")
    close(con)
  }
    
	table
}

### WRITE CSV UNICODE WITH GEORGIAN CHARACTERS

geo_write.csv<-function (df,filename) {
  ## Converting dates as characters
  n<-names(df[,sapply(df, class)=="Date"])
  df[,n]<-sapply(n, function (x) as.character(format(df[,x])))
  
  ## checking if comma
  comma<-as.logical(sum(sapply(a,function(x) grepl(",",x))))
  
	BOM <- charToRaw('\xEF\xBB\xBF')
	EOL<-"\r\n"
	con <- file(filename, "wb")
	writeBin(BOM, con, endian="little")
	df_header<-paste(paste(names(df),collapse=","),EOL,sep="")

	for (i in 1:nrow(df)) {
		line<-paste(df_header,paste(df[i,],collapse=","),EOL,sep="")
		if (grepl(",",paste(df[i,],collapse=""))) warning("there is comma")
		writeBin(charToRaw(line), con, endian="little")
		df_header<-NULL
	}
	close(con)
}

