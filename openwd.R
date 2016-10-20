openwd = function(a = NULL){
        if(is.null(a)){
                a = getwd()
        }
        win_path = paste("explorer", gsub("/", "\\\\", a))
        
        shell(win_path, intern=TRUE) 
}
