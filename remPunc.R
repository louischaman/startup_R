# saves the data frame in a fake file then re-reads it to guess column types
remPunc <- function (str, replacement = ""){
        return(gsub("[[:punct:]]", replacement, str))

}