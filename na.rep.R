na.rep = function(data, replacement = 0){
        data[is.na(data)] = replacement
        return(data)
}