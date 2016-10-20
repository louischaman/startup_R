dfbind = function(df_origin, df_new){
        if(is.null(df_new)){ return(df_origin)}
        if(nrow(df_origin)==0 )  {
                return(df_new)
        }
        else{
                return(rbind(df_origin,df_new))
        }
        
}