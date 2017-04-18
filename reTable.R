# saves the data frame in a fake file then re-reads it to guess column types
reTable <- function (df_in){
        zz <- textConnection("foo","w")
        write.csv(df_in, zz, row.names = F)
        a = paste(textConnectionValue(zz), collapse = " \n")
        close(zz)
        df_out = read.csv(textConnection(a), stringsAsFactors = F)
        return(df_out)

}