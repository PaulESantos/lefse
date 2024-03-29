#' Functional NND
#' @description Quantifies the functional mean nearest neighbor distance with no abundance weighting
#' @usage Fmntd(dist.mat, my.sample)
#'
#' @param dist.mat A trait distance matrix.
#' @param my.sample A community data matrix.
#'
#' @return The presence-absence weighted mean nearest functional neighbor distance for each community
#' @export
#' @references Swenson, N.G. 2014. Functional and Phylogenetic Ecology in R. Springer UseR! Series, Springer, New York, New York, U.S.A.
#' @author Nathan G. Swenson
#' @seealso \code{\link{Fmntd.a}}
#' @examples
#' data(lefse_sample)
#' data(lefse_traits)
#' Fmntd(as.matrix(dist(lefse_traits)), lefse_sample)
Fmntd <-
  function(dist.mat, my.sample){


    Fmntd.sub = function(x){

      ## Get the names of the species present in a
      ## community.
      com.names = names(x[x > 0])

      ## Make the community phylogenetic distance
      ## matrix by extracting those rows and columns
      ## that have species present in our community.
      my.com.dist = dist.mat[com.names, com.names]

      ## Set all diagonal values to NA so that the
      ## zeros for conspecific comparisons do not
      ## interfere with our calculation of nearest
      ## neighbors.
      diag(my.com.dist) = NA

      ## Use apply() to calculate the minimum value in
      ## each row of the community phylogenetic
      ## distance matrix and take a mean of those
      ## values.
      mean(apply(my.com.dist, MARGIN = 1, min, na.rm=T), na.rm=T)

    }

    apply(my.sample, MARGIN = 1, Fmntd.sub)

  }
