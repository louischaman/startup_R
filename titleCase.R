# function to change to title case
titleCase <- function(x) {
        x_lower = tolower(x)
        s <- strsplit(x_lower, " ")
        out_x = sapply(s, function(a){ paste(toupper(substring(a, 1,1)), substring(a, 2),
                                             sep="", collapse=" ")
        })
        out_x[is.na(x)] = NA
        return(out_x)
        
}
