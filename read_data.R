read_data = function(path, match_string, data_type = "rds"){
        require(tools)
        # extract actual date from date \\ month 
        file_list = list.files(path, full.names = T)
        
        # select data with correct name
        right_files = file_list[grep(match_string, file_list)]
        
        # right file type 
        right_file_type = right_files [file_ext(right_files ) == data_type]
        
        right_file_type_ord = right_file_type[order(right_file_type, decreasing = T)][1]
        
        
        if(length(right_file_type) == 0 ){ stop("no matches")}
        
        if(data_type == "rds"){
                return_data = readRDS(right_file_type_ord)
        }
        else{ stop("unkown type") }
        
        return( return_data)
}
