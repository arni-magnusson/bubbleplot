#' Bubble Plot
#'
#' Draw a bubble plot, a scatterplot with varying symbol sizes and colors.
#'
#' @param x a vector of values for the horizontal axis. Can also be a
#'        2-dimensional matrix or table data frame (x values in column names and
#'        y values in rows), or a data frame containing \code{x}, \code{y}, and
#'        \code{z} in that order.
#' @param y a vector of values for the vertical axis.
#' @param z a vector of values determining the bubble sizes.
#' @param std whether to standardize \code{z} by dividing with \code{mean(z)}.
#' @param pow a power coefficient for the bubble sizes (\code{0.5} is the square
#'        root).
#' @param add whether to add bubbles to an existing plot.
#' @param rev whether to reverse the y axis.
#' @param cex.points scales all bubble sizes.
#' @param type passed to \code{points}.
#' @param ylim passed to \code{plot}.
#' @param xlab passed to \code{plot}.
#' @param ylab passed to \code{plot}.
#' @param pch passed to \code{points}.
#' @param col passed to \code{points}.
#' @param bg passed to \code{points}.
#' @param \dots passed to \code{bubbleplot.*} methods.
#' @param formula has the form \code{z ~ x + y}, where \code{z} determines the
#'        bubble sizes and \code{x} and \code{y} determine bubble locations.
#' @param data where formula terms are stored, e.g. data frame or list.
#' @param subset a logical vector specifying which data to plot.
#' @param na.action how \code{NA} values are handled.
#'
#' @note
#' Negative \code{z} values are drawn in \code{pch[2]}, \code{col[2]}, and
#' \code{bg[2]}.
#'
#' @seealso
#' \code{\link{points}} is the underlying function used to draw the bubbles.
#'
#' \code{\link{symbols}} can also draw bubbles, but does not handle negative
#' \code{z} values or have convenience features such as \code{pow} and
#' \code{rev}.
#'
#' \code{\link{bubbleplot-package}} gives an overview of the package.
#'
#' @examples
#' # Tree circumference
#' bubbleplot(circumference~Tree+age, Orange, pow=1, cex=2)
#'
#' library(nlme)
#' fm <- nlme(circumference~phi1/(1+exp(-(age-phi2)/phi3)),
#'            fixed=phi1+phi2+phi3~1, random=phi1~1|Tree,
#'            data=Orange, start=c(phi1=200,phi2=800,phi3=400))
#'
#' # Model residuals
#' bubbleplot(residuals(fm)~Tree+age, Orange)
#' bubbleplot(residuals(fm)~Tree+age, Orange, cex=2.5, pch=16,
#'            col=c("dodgerblue","orange"))
#'
#' # Richter magnitude, amplitude, and energy release
#' bubbleplot(mag~long+lat, quakes, pch=1)
#' bubbleplot(10^mag~long+lat, quakes, cex=1.2, col=gray(0, 0.3))
#' bubbleplot(sqrt(1000)^mag~long+lat, quakes, cex=1.2, col=gray(0, 0.3))
#'
#' @importFrom graphics par plot points
#' @importFrom utils type.convert
#'
#' @export

bubbleplot <- function(x, ...)
{
  UseMethod("bubbleplot")
}

#' @rdname bubbleplot
#' @export
#' @export bubbleplot.default

bubbleplot.default <- function(x, y, z, std=TRUE, pow=0.5, add=FALSE, rev=FALSE,
                               type="p", ylim=NULL, xlab=NULL, ylab=NULL,
                               pch=c(16,1), cex.points=1, col="black",
                               bg=par("bg"), ...)
{
  pch <- rep(pch, length.out=2)
  col <- rep(col, length.out=2)
  bg <- rep(bg, length.out=2)

  if(is.matrix(x))  # matrix or table
  {
    dnn <- names(dimnames(x))
    if(is.null(xlab))
      xlab <- if(is.null(dnn)) "" else dnn[2]
    if(is.null(ylab))
      ylab <- if(is.null(dnn)) "" else dnn[1]
    y <- as.data.frame(as.table(x))[[1]]
    z <- as.data.frame(as.table(x))[[3]]
    x <- as.data.frame(as.table(x))[[2]]
  }

  if(is.list(x))  # data.frame or list
  {
    if(is.null(xlab))
      xlab <- names(x)[1]
    if(is.null(ylab))
      ylab <- names(x)[2]
    y <- x[[2]]
    z <- x[[3]]
    x <- x[[1]]
  }

  if(is.null(ylim))
    ylim <- range(y)
  if(rev)
    ylim <- rev(ylim)
  if(is.null(xlab))
    xlab <- deparse(substitute(x))
  if(is.null(ylab))
    ylab <- deparse(substitute(y))

  ## Convert factor to numeric
  x <- type.convert(as.character(x))
  y <- type.convert(as.character(y))

  if(std)
    mycex <- cex.points * (abs(z)/mean(abs(z)))^pow
  else
    mycex <- cex.points * abs(z)^pow

  if(!add)
    suppressWarnings(plot(x, y, type="n", ylim=ylim, xlab=xlab, ylab=ylab, ...))
  suppressWarnings(points(x[z>0], y[z>0], type=type, cex=mycex[z>0],
                          pch=pch[1], col=col[1], bg=bg[1], ...))
  suppressWarnings(points(x[z<0], y[z<0], type=type, cex=mycex[z<0],
                          pch=pch[2], col=col[2], bg=bg[2], ...))
}

#' @rdname bubbleplot
#' @export
#' @export bubbleplot.formula

bubbleplot.formula <- function(formula, data, subset, na.action=NULL, ...)
{
  m <- match.call(expand.dots=FALSE)
  if(is.matrix(eval(m$data,parent.frame())))
    m$data <- as.data.frame(data)
  m$... <- NULL
  m[[1L]] <- quote(model.frame)
  mf <- eval(m, parent.frame())

  if(ncol(mf) < 3)
    stop("formula must have the form z ~ x + y")

  bubbleplot.default(mf[c(2,3,1)], ...)
}
