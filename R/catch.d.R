#' @docType data
#'
#' @name catch.d
#'
#' @title Catch at Age Data Frame
#'
#' @description Catch-at-age table as a long data frame.
#'
#' @usage
#' catch.d
#'
#' @format
#' Data frame containing three columns:
#' \tabular{ll}{
#'   \code{Year}  \tab year\cr
#'   \code{Age}   \tab age\cr
#'   \code{Catch} \tab catch (thousands of individuals)
#' }
#'
#' @details
#' The data are from Table 8.2 in the ICES (2015) assessment of Icelandic
#' saithe.
#'
#' @source
#' ICES (2015) Report of the North-Western Working Group (NWWG).
#' \href{https://ices.dk/sites/pub/Publication\%20Reports/Expert\%20Group\%20Report/acom/2015/NWWG/01\%20NWWG\%20Report\%202015.pdf}{\emph{ICES CM 2015/ACOM:07}},
#' pp. 240--241.
#'
#' @seealso
#' \code{\link{catch.m}} is the same data in a wide \code{matrix}.
#'
#' \code{\link{catch.r}} are standardized residuals from a stock assessment
#' model fit.
#'
#' \code{\link{bubbleplot-package}} gives an overview of the package.
#'
#' @examples
#' bubbleplot(catch.m)
#' bubbleplot(catch.d)
#' bubbleplot(Catch~Age+Year, catch.d)
#' bubbleplot(Catch~Age+Year, catch.d, rev=TRUE, las=1)

NA
