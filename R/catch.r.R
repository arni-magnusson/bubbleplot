#' @docType data
#'
#' @name catch.r
#'
#' @title Catch at Age Residuals
#'
#' @description
#' Catch-at-age standardized log residuals from a fitted stock assessment model.
#'
#' @usage
#' catch.r
#'
#' @format
#' Data frame containing three columns:
#' \tabular{ll}{
#'   \code{Year}  \tab year\cr
#'   \code{Age}   \tab age\cr
#'   \code{Resid} \tab standardized residual
#' }
#'
#' @details
#' The values are from Table 8.6 in the ICES (2015) assessment of Icelandic
#' saithe.
#'
#' The standardized log residuals are based on observed and fitted catch at age:
#'
#' \deqn{\frac{\log(C/\hat C)}{\sigma_c}}{log(Obs/Fit) / sigma}
#'
#' where \eqn{\sigma_c}{sigma} is the standard deviation of
#' \eqn{\log(C/\hat C)}{log(Obs/Fit)}.
#'
#' @source
#' ICES (2015) Report of the North-Western Working Group (NWWG).
#' \href{https://ices.dk/sites/pub/Publication\%20Reports/Expert\%20Group\%20Report/acom/2015/NWWG/01\%20NWWG\%20Report\%202015.pdf}{\emph{ICES CM 2015/ACOM:07}},
#' p. 246.
#'
#' @seealso
#' \code{\link{catch.d}} and \code{\link{catch.m}} are the observed catch-at-age
#' data.
#'
#' \code{\link{bubbleplot-package}} gives an overview of the package.
#'
#' @examples
#' bubbleplot(catch.m)
#' bubbleplot(catch.d)
#' bubbleplot(Catch~Age+Year, catch.d)
#' bubbleplot(Catch~Age+Year, catch.d, rev=TRUE, las=1)

NA
