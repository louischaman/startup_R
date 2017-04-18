charInput = function(char_array){
        first_str = paste(char_array, collapse = "\", \n\t\"") 
        out_str = paste0("c(\n\t\"", first_str, "\"\n)")
        cat(out_str)
        #return(out_str)
} 