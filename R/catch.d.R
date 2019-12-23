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
