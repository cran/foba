\name{boston}
\alias{boston}
\title{Partial Boston Housing data}
\description{
   The full data have 506 samples with 14 variables. The MEDV is the target variable. This version contains only the first 50 samples.
}
\format{
  The list \code{boston} contains the following components:
  \describe{
    \item{x}{a 50 x 13 matrix, corresponding to the variables except MEDV}
    \item{y}{a 50 dimensional vector, corresponding to the MEDV variable}
  }
}
\source{
The full data is available from the UCI Repository Of Machine Learning Databases at \url{http://www.ics.uci.edu/~mlearn/MLRepository.html}
}
\references{
D. Harrison and D.L. Rubinfeld, 
"Hedonic prices and the demand for clean air", 
J. Environ. Economics & Management, vol.5, 81-102, 1978.
}
\keyword{datasets}
