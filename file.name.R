file.name = function(path, original_file_name = "", extension = NA, new_text = ""){
        library(tools)
        little_filename =  file_path_sans_ext( basename(original_file_name) )
        if(!is.na(extension)){
                extension0 = gsub("\\.", "", extension)
        }else{
                extension0 = file_ext(path)
        }
        
        out_path = file_path_sans_ext(path)
        
        path_one = paste0(  file.path(out_path, little_filename), new_text,".", extension0)
        return(path_one)
} 