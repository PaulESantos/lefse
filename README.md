
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lefse

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/lefse)](https://CRAN.R-project.org/package=lefse)
<!-- badges: end -->

The goal of lefse is to …

## Installation

You can install the development version of lefse like so:

``` r
remotes::install_github("PaulESantos/lefse")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(lefse)
#> This is lefse 0.1.1
# data
data("lefse_sample")
data("lefse_traits")
# Moments
lefse::com.trait.moments(lefse_sample, lefse_traits)
#>      mean.trait1 mean.trait2 mean.trait3 sd.trait1 sd.trait2 sd.trait3
#> com1   1.3694710    1.023698  0.28680418 1.1560790 1.1172262  2.045614
#> com2   1.0222948    1.623114 -0.09971527 0.5095456 0.7626977  1.193765
#> com3   0.1598149    1.146566 -0.28780787 0.3524260 0.7113560  1.860278
#> com4   1.5978593    1.318545 -0.01983560 0.5820404 1.0920528  1.381920
#> com5   1.1637150    1.164486  0.61409294 0.9874299 0.9194120  1.366096
#>      skew.trait1 skew.trait2 skew.trait3 kurtosis.trait1 kurtosis.trait2
#> com1  0.19682898  -0.3829630  0.20890623       -2.333333       -2.333333
#> com2  0.01988454  -0.1976568 -0.05811260       -2.333333       -2.333333
#> com3 -0.20382127  -0.1103629 -0.03046137       -2.081669       -2.304380
#> com4  0.67038538  -0.1046861  0.79255073       -1.134004       -1.739160
#> com5 -0.01746914  -0.2714155 -0.01122318       -1.393528       -1.587981
#>      kurtosis.trait3
#> com1      -2.3333333
#> com2      -2.3333333
#> com3      -2.3566649
#> com4      -0.8811527
#> com5      -1.6331410
# 
lefse::com.trait.weighted(lefse_sample, lefse_traits)
#>      mean.trait1 mean.trait2 mean.trait3 sd.trait1 sd.trait2 sd.trait3
#> com1  1.15784888  -0.1978223  -0.1147683 0.9272474 1.3534886  1.654573
#> com2  1.13766710   2.0784576  -0.3918205 0.7072673 0.4104868  1.655456
#> com3 -0.04939595   0.6252821  -0.6241005 0.2813580 0.5228750  2.405138
#> com4  1.78073300   2.0508493  -0.3738947 0.5524677 0.8828587  1.687830
#> com5  0.78251751   1.1443715   0.3857198 0.8021278 1.1064094  1.249642
#
lefse::trait.range(lefse_sample, lefse_traits)
#>            com1     com2      com3     com4     com5
#> trait1 2.275244 1.018940 0.8018377 1.613726 2.909830
#> trait2 1.971381 1.500815 1.4445999 2.940564 2.560432
#> trait3 4.016643 2.384484 3.7682731 3.846372 3.846372
```
