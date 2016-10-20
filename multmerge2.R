multmerge2 = function(path, read_fn = read.csv){
        file_path = list.files(path, full.names = T)
        n_files = length(file_path)
        count_rows = 0
        
        
        
        j = 1
        print(paste("file", j , "of", n_files))
        
        # reads first file and make it the data frame
        file = file_path[j]
        df = read_fn(file)
        count_rows = count_rows + nrow(df)
        
        guess_rows = (count_rows + 100) * n_files
        df_large = df[rep(1,guess_rows),]
        df_large[1:count_rows,] = df
        
        for(j in 2:n_files){
                print(paste("file", j , "of", n_files))
                file = file_path[j]
                df = read_fn(file)
                count_rows_new = count_rows +nrow(df)
                while(count_rows_new>guess_rows){
                        # increase guessed size by 10
                        guess_rows_new = guess_rows*10
                        df_temp = df_large
                        df_large = df[rep(1,guess_rows_new),]
                        df_large[1:guess_rows,] = df_temp
                        guess_rows = guess_rows_new
                }
                df_large[(count_rows+1):count_rows_new,] = df
                count_rows = count_rows_new   
                
        }
        return(df_large[1:(count_rows),])
}
