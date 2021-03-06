% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{convolve_double_gamma}
\alias{convolve_double_gamma}
\title{This function convolves a stimulus vector with the double-gamma hrf}
\arguments{
\item{x}{A vector of volume numbers used to evaluate the function at each value}

\item{a1}{The a1 parameter of the double gamma}

\item{a2}{The a2 parameter of the double gamma}

\item{b1}{The b1 parameter of the double gamma}

\item{b2}{The b2 parameter of the double gamma}

\item{cc}{The cc parameter of the double gamma}
}
\value{
A vector of the double-gamma HRF at each value of \code{x}
}
\description{
This function convolves a stimulus vector with the double-gamma hrf
}
\details{
This is an internal function that is used by convolve_hrf
}
\author{
Michael Hallquist
}
