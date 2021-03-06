crossJoin2 = function(x,y){
        x = as.data.frame(x)
        y = as.data.frame(y)
        x_expand = x[rep(seq_len(nrow(x)), each=nrow(y)),]
        y_expand = y[rep(seq_len(nrow(y)), nrow(x)),]
        out_data = data.frame(x_expand, y_expand, stringsAsFactors = F)
        
        fullname = c(names(x), names(y))
        names(out_data) = fullname
        return(out_data)
}
crossJoin = function(...){
        input_list <- list(...)
        output = Reduce(crossJoin2, input_list)
        return(output)
}