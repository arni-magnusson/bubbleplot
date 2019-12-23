#' @docType data
#'
#' @name catch.m
#'
#' @title Catch at Age Matrix
#'
#' @description Catch-at-age table as a wide matrix.
#'
#' @usage
#' catch.m
#'
#' @format
#' Matrix with years as row names and ages in columns:
#' \tabular{ll}{
#'   \code{3} \tab number of three-year-olds in the catch (thousands)\cr
#'   \code{4} \tab number of four-year-olds in the catch (thousands)\cr
#'   \tab\dots\cr
#'   \code{14} \tab number of fourteen-year-olds in the catch (thousands)
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
#' \code{\link{catch.d}} is the same data in a long \code{data.frame}.
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
