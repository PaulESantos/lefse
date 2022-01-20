#' Sourse SDMTools package
#' @keywords internal
wt.var <- function(x,wt) {
  s = which(is.finite(x + wt)); wt = wt[s]; x = x[s] #remove NA info
  xbar = weighted.mean(x,wt) #get the weighted mean
  return( sum(wt *(x-xbar)^2)*(sum(wt)/(sum(wt)^2-sum(wt^2))) ) #return the variance
}
#' @keywords internal
wt.sd <- function(x,wt) {
  return( sqrt(wt.var(x,wt)) ) #return the standard deviation
}
