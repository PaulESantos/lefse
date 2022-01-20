#' Range of trait values in a community
#' @description Quantifies the range of trait values present in a community
#' @usage trait.range(my.sample, traits)
#' @param my.sample A community data.matrix.
#' @param traits A trait matrix.
#'
#' @return The range of trait values for each community.
#' @export
#'
#' @examples
#' data(lefse_sample)
#' data(lefse_traits)
#' trait.range(lefse_sample, lefse_traits)
trait.range <-
  function(my.sample, traits){

    range.sub = function(x){

      com.names = names(x[x > 0])

      apply(traits[com.names, ], MARGIN = 2, max,na.rm=T) - apply(traits[com.names, ], MARGIN = 2, min,na.rm=T)
    }

    apply(my.sample, MARGIN = 1, range.sub)

  }
