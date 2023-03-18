#' Quantifies the moments of the community trait distribution weighted by abundance
#'
#' @description Quantifies the moments of the community trait distribution weighted by abundance
#'
#' - \code{com.weighted.mean} The abundance weighted mean trait value in the community
#' - \code{com.weighted.sd} The abundance weighted standard deviation of trait values in the community
#'
#' @usage com.trait.weighted(my.sample, traits)
#'
#' @param my.sample  A community data matrix.
#' @param traits A trait file with species names as row names and trait as columns.
#'
#' @references Swenson, N.G. 2014. Functional and Phylogenetic Ecology in R. Springer UseR! Series, Springer, New York, New York, U.S.A.
#' @author Nathan G. Swenson
#'
#' @importFrom stats sd var weighted.mean
#' @return a data.frame
#' @export
#'
#' @examples
#' data("lefse_sample")
#' data("lefse_traits")
#' com.trait.weighted(lefse_sample, lefse_traits)
com.trait.weighted <-
  function(my.sample, traits){

    mean.output = matrix(NA, nrow=nrow(my.sample), ncol=ncol(traits))
    sd.output = matrix(NA, nrow=nrow(my.sample), ncol=ncol(traits))
    ##################################
    #'# Sourse SDMTools package
    #'wt.var <- function(x,wt) {
    #'  s = which(is.finite(x + wt)); wt = wt[s]; x = x[s] #remove NA info
    #'  xbar = weighted.mean(x,wt) #get the weighted mean
    #'  return( sum(wt *(x-xbar)^2)*(sum(wt)/(sum(wt)^2-sum(wt^2))) ) #return the variance
    #'}
#'
    #'wt.sd <- function(x,wt) {
    #'  return( sqrt(wt.var(x,wt)) ) #return the standard deviation
    #'}
    ##################################
    ##################################
    for(i in 1:ncol(traits)){
      weight.mean.funk = function(x){
        weighted.mean(traits[names(x[x>0]), i] , x[x > 0])
      }

      weight.sd.funk = function(x){
        wt.sd(traits[names(x[x>0]), i] , x[x>0])
      }



      mean.output[,i] = apply(my.sample, MARGIN = 1, weight.mean.funk)
      sd.output[,i] = apply(my.sample, MARGIN = 1, weight.sd.funk)
    }


    output = cbind(mean.output, sd.output)
    colnames(output)=paste(c(rep("mean",ncol(traits)), rep("sd",ncol(traits)) ), rep(names(traits), 2), sep=".")
    rownames(output) = rownames(my.sample)
    output

  }
