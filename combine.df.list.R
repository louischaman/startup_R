combine.df.list = function(df_list){
        
        full_names = do.call(c,lapply( df_list, names)) %>% unique()
        full_names = full_names[order(full_names)]
        
        
        
        full_df = matrix(data = NA,nrow = 0,ncol = length(full_names)) %>% as.data.frame()
        names(full_df) = full_names 
        
        for(i in 1:length(df_list)){
                df = df_list[[i]]
                
                new_df = matrix(data = NA,nrow = nrow(df),ncol = length(full_names)) %>% as.data.frame()
                names(new_df) = full_names 
                
                name_index = match(names(df),full_names)
                new_df[,name_index] = df
                full_df = rbind(full_df, new_df)
        }
        
        return(full_df)
}