file.name = function(path, original_file_name = "", extension, new_text = ""){
        library(tools)
        little_filename =  file_path_sans_ext( basename(original_file_name) )
        extension0 = gsub("\\.", "", extension)
        
        out_path = file_path_sans_ext(path)
        
        path_one = paste0(  file.path(out_path, little_filename), new_text,".", extension0)
        return(path_one)
} 