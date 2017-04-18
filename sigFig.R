
sigFigInd <- function (num, sf){
        n_digits = floor(log(num)/log(10)) + 1
        out_num = formatC(signif(num,digits=n_digits+sf), digits=n_digits+sf,format="fg", flag="#")
        
        return(out_num)

}
sigFig = function(num2, sf){
        df = data.frame(num3 = num2,sf = sf)
        apply(df,1,function(row){sigFigInd(as.numeric(row[1]),as.numeric(row[2]) )})
        
}