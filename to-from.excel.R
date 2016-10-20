write.excel <- function(x,row.names=F,col.names=TRUE,...) {
        write.table(x,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}

#write.excel(dat)

read.excel <- function(header=TRUE,...) {
        read.table("clipboard",sep="\t",header=header,..., stringsAsFactors = F)
}

#dat=read.excel()