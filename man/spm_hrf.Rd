% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spm_funcs.R
\name{spm_hrf}
\alias{spm_hrf}
\title{R port of spm8 functions needed for deconvolution
spm_hrf - Returns a hemodynamic response function as a difference of gammas (canonical)}
\usage{
spm_hrf(TR, P)
}
\arguments{
\item{TR}{scan repetition time (seconds)}

\item{P}{7-element vector of parameters for the response function (two gamma functions) -- see details}
}
\value{
A list containing $hrf and $p
}
\description{
R port of spm8 functions needed for deconvolution
spm_hrf - Returns a hemodynamic response function as a difference of gammas (canonical)
}
\details{
USAGE:
   hrf = spm_hrf(TR,[p])

INPUT:
   TR   - scan repetition time (seconds)
   P    - 7-element vector of parameters for the response function (two gamma functions)
                                                   (default value, in seconds)
   P[1] - delay of response (relative to onset)    (6)
   P[2] - delay of undershoot (relative to onset)  (16)
   P[3] - dispersion of response                   (1)
   P[4] - dispersion of undershoot                 (1)
   P[5] - ratio of response to undershoot          (6)
   P[6] - onset (seconds)                          (0)
   P[7] - length of kernel (seconds)               (32)

OUTPUT:
   $hrf    - hemodynamic response function
   $p      - parameters of the response function
}
\examples{

  hrf <- spm_hrf(1.5) #HRF for a 1.5-second TR sequence

  hrf <- spm_hrf(1.5, c(4, 12)) #override P[1] and P[2], keep P[3:7] at defaults

}
\author{
Karl Friston (adapted by Michael Hallquist)
}
