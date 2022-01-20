#' Functional standard deviation of the NND with abundance weighting
#'
#' @description Quantifies the functional standard deviation of the nearest neighbor distance with abundance weighting.
#' @usage Fsntd.a(dist.mat, my.sample)
#' @param dist.mat A trait distance matrix.
#' @param my.sample A community data matrix.
#'
#' @return The abundance weighted standard deviation of the nearest functional neighbor distance for each community
#' @export
#'
#' @references Swenson, N.G. 2014. Functional and Phylogenetic Ecology in R. Springer UseR! Series, Springer, New York, New York, U.S.A.
#' @author Nathan G. Swenson
#' @seealso \code{\link{Fsntd}}
#' @examples
#' data(lefse_sample)
#' data(lefse_traits)
#' Fsntd.a(as.matrix(dist(lefse_traits)), lefse_sample)
Fsntd.a <-
  function(dist.mat, my.sample){

    Fsntd.a.sub = function(x){

      ## Get the names of species present in the
      ## community.
      com.names = names(x[x > 0])

      ## Make the community phylogenetic distance
      ## matrix using the names of the species present ## in the community.
      my.com.dist = dist.mat[com.names, com.names]

      ## Place NA values in the diagonals
      diag(my.com.dist) = NA

      ## Calculate a mean of the minimum values in each
      ## row of the community phylogenetic distance
      ## matrix weighed by the abundances of the
      ## species present in the community.
      wt.sd(apply(my.com.dist, 1, min, na.rm = T), x[x > 0])

    }

    apply(my.sample, MARGIN = 1, Fsntd.a.sub)

  }
