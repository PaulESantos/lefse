#' Functional MPD with abundance
#' @description Quantifies the functional mean pairwise distance with abundance weighting
#' @usage Fmpd.a(dist.mat, my.sample)
#' @param dist.mat A trait distance matrix.
#' @param my.sample A community data matrix.
#'
#' @references  Swenson, N.G. 2014. Functional and Phylogenetic Ecology in R. Springer UseR! Series, Springer, New York, New York, U.S.A.
#' @author Nathan G. Swenson
#' @seealso \code{\link{Fmpd}}
#' @return The abundance weighted mean pairwise distance for each community
#' @importFrom stats weighted.mean
#' @export
#'
#' @examples
#' data(lefse_sample)
#' data(lefse_traits)
#' Fmpd.a(as.matrix(dist(lefse_traits)), lefse_sample)
Fmpd.a <-
  function(dist.mat, my.sample){

    Fmpd.a.sub = function(x){

      ## Get the names of the species in the community.
      com.names = names(x[x > 0])

      ## Make a matrix with one row containing
      ## abundances and names of all present species
      com = t(as.matrix(x[x > 0]))

      ## Make phylogenetic distance matrix for taxa in ## community.
      com.dist = dist.mat[com.names, com.names]

      ## Calculate the product of the abundances of all
      ## species in the community.
      abundance.products = t(as.matrix(com[1, com[1, ] > 0, drop = F]))%*% as.matrix(com[1, com[1, ] > 0, drop = F])

      ## Calculate a mean of the community phylogenetic
      ## distance matrix weighted by the products of
      ## all pairwise abundances.
      weighted.mean(com.dist, abundance.products)

    }


    apply(my.sample, MARGIN = 1, Fmpd.a.sub)

  }
