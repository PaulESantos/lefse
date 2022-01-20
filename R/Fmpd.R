#' Functional MPD no with abundance
#' @description Quantifies the functional mean pairwise distance with no abundance weighting
#' @usage  Fmpd(dist.mat, my.sample)
#' @param dist.mat A trait distance matrix.
#' @param my.sample A community data matrix.
#'
#' @return The presence-absence weighted mean pairwise distance for each community
#' @export
#'
#' @references Swenson, N.G. 2014. Functional and Phylogenetic Ecology in R. Springer UseR! Series, Springer, New York, New York, U.S.A.
#' @author Nathan G. Swenson
#' @seealso \code{\link{Fmpd.a}}
#' @importFrom stats as.dist
#' @examples
#' data(lefse_sample)
#' data(lefse_traits)
#' Fmpd(as.matrix(dist(lefse_traits)), lefse_sample)
Fmpd <-
  function(dist.mat, my.sample){

    Fmpd.sub = function(my.sub.sample){

      ## Get the names of species present in the
      ## community
      com.names = names(my.sub.sample[my.sub.sample > 0])

      ## Calculate mpd by extracting the lower triangle
      ## of a phylogenetic distance matrix comprised of
      ## only the species in our community.
      mean(as.dist(dist.mat[com.names, com.names]))

    }


    apply(my.sample, MARGIN = 1, Fmpd.sub)

  }
