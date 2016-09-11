### READ CSV UNICODE WITH GEORGIAN CHARACTERS
geo_read.csv<-function(f,skip=0,header=T,method="UTF-8",colclass="character",trsheader=F) {
	if ((method=="UTF-8" | method=="UTF-8-BOM") & !trsheader) {
    table<-read.csv(f, encoding="UTF-8",skip=skip,header=header,colClasses=colclass)
  	if(method=="UTF-8-BOM")	names(table)[1]<-substring(names(table)[1],10)
	}
  else {
    if (method=="UTF-8-BOM") method="UTF-8"
    A <- readLines(con <- file(f, encoding = method))
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
  n<-names(df[sapply(df, class)=="Date"])
  df[,n]<-sapply(n, function (x) as.character(format(df[,x])))
  
  ## checking if comma
  comma<-as.logical(sum(sapply(df,function(x) grepl(",",x))))
  quto<-ifelse(comma,'\"',"")
  
	BOM <- charToRaw('\xEF\xBB\xBF')
	EOL<-"\r\n"
	con <- file(filename, "wb")
	writeBin(BOM, con, endian="little")
	df_header<-paste(paste(names(df),collapse=","),EOL,sep="")

	for (i in 1:nrow(df)) {
		line<-paste(df_header,quto,paste(df[i,],collapse=paste(quto,",",quto,sep="")),quto,EOL,sep="")
		writeBin(charToRaw(line), con, endian="little")
		df_header<-NULL
	}
	close(con)
}

