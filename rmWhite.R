# returns string w/o leading or trailing whitespace
rmWhite <- function (x) gsub("^\\s+|\\s+$", "", x)