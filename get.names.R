get_names <- function(x) { 
        # outputs column names of x in a way that is easy to paste into code for selections
        cat(paste( c( "c( \n", paste0("\"", names(x), "\", \n") , ")") , collapse = ""))
                     
        }
