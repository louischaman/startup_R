openwd = function(a = NULL, justFolder = T){
        require(tools)
        if(is.null(a)){
                a = getwd()
        }
        
        if(justFolder & file_ext(a) != ""){
                a  = dirname(a )
        }
        
        win_path = paste("explorer", gsub("/", "\\\\", a))
     
        
        shell(win_path, intern=TRUE) 
}
