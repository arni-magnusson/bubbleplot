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
#' # 1  Formula
#' bubbleplot(Catch~Age+Year, data=catch.d)
#' # Compare this plot with catch.m layout
#' print(catch.m)
#' bubbleplot(Catch~Age+Year, data=catch.d, rev=TRUE, las=TRUE)
#'
#' # 2  Data frame
#' bubbleplot(catch.d)
#'
#' # 3  Matrix or table
#' bubbleplot(catch.m)
#' catch.t <- xtabs(Catch~Year+Age, catch.d)
#' bubbleplot(catch.t)
#'
#' # 4  Positive and negative values
#' bubbleplot(catch.r)
#' bubbleplot(Resid~Age+Year, catch.r, subset=Age %in% 4:9,
#'            rev=TRUE, xlim=c(3.5,9.5), cex=1.3)

NA
