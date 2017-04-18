char.num <- function(x) { 
                split_nums = strsplit(x, "")
                char_str = as.data.frame(do.call(cbind, split_nums))
                char_str_2 = cbind(num = 1:nrow(char_str), char_str)
                return(char_str_2)
                     
        }
