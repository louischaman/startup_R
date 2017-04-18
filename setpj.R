setpj <- function(project_string = "", newpj = "") { 
                
                
        
                if(Sys.info()["nodename"] == "LDNLAP6LR5M32"){ 
                        proj_csv = "C:/dev/R/startup_data/project_dirs.csv"
                }else{
                        stop("pc not known") 
                }
        
                pj_df = read.csv(proj_csv, stringsAsFactors = F)
                pj_df$id = 1:nrow(pj_df)
                
                ## if project_string is a number less than the number of projects select that project
                string_no = as.numeric(project_string)
                
                if(!is.na(string_no) & string_no<=nrow(pj_df) ){
                        project_string = pj_df$project[string_no]
                }
                
                # if it is a string in that list then get that project
                if(project_string %in% pj_df$project){
                        
                        pjdir = pj_df$location[pj_df$project == project_string]
                        setwd(pjdir)
                        openwd()
                        
                # if it is a new project add to the list
                }else if(newpj != ""){ 
                        new_row = pj_df[1,]
                        new_row$project = names(newpj)
                        new_row$location = newpj[1]
                        pj_df = rbind(pj_df, new_row)
                        write.csv(pj_df, proj_csv)
                        
                # or display a list of all projects
                }else{
                        cat(paste(c("Projects list is: "," ", paste(pj_df$id, pj_df$project)), collapse = "\n") )
                }
                
                
}
