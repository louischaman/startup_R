write.data = function(
        data, 
        data_name,
        folder_name = getwd(),
        path = "",
        descrition = "",
        source = list(
                organisaiton =	"",
                contact= list(
                        "name"= "",
                        "email"= ""
                )
        ),
        dateReceived=	"YYYY-MM-DD",
        type = "rds"
        
)
{
        if(! path == ""){
                folder_name = path
        }
        require(jsonlite)
        require(data.table)
        
        if (missing(data_name)){
                data_name = deparse(substitute(data))
        }
        
        column_names = names(data)
        time_now =  Sys.time()
        columns = data.frame(columnName = column_names,
                             description= "",
                             type = "",
                             units = "")
        
        metadata = list(
                datasetName = data_name,
                description = descrition,
                source = source,
                Received= dateReceived,
                Modified= format(time_now, "%y-%m-%d %H:%M:%S"),
                columns = columns
        )
        
        base_name = paste(data_name, format(time_now, "_%Y-%m-%d--%H-%M-%S"), sep = "")
        metadata_file_name = paste(folder_name, "/",base_name, "_metadata.json", sep = "")
        metadata_json = toJSON(metadata, pretty = T, auto_unbox = TRUE)
        
        cat(metadata_json,file = metadata_file_name)
        print("writing data")
        
        
        if(type == "csv"){
                data_file_name = paste(folder_name, "/", base_name, "_data.csv", sep = "")
                write.csv(data, data_file_name, row.names = F)
        }else if(type == "rds"){
                data_file_name = paste(folder_name, "/", base_name, "_data.rds", sep = "")
                saveRDS(data, data_file_name)
        }else{
                stop("type not recognised")
        }
        
        return(base_name)
        
}

