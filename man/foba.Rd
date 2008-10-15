\name{foba}
\alias{foba}
\title{
Greedy variable selection for ridge regression
}
\description{
Variable Selection for Ridge Regression using Forward Greedy, Backward Greedy, and Adaptive Forward-Backward Greedy (FoBa) Methods
}
\usage{
foba(x,y, type=c("foba","foba.aggressive", "foba.conservative", "forward","backward"), steps=0, intercept=TRUE, nu=0.5,lambda=1e-10) 
}
\arguments{
\item{x}{
matrix of predictors
}
\item{y}{
response 
}
\item{type}{
One of  "foba", "foba.aggressive", "foba.conservative", "forward", or "backward". The names can
be abbreviated to any unique substring. Default is "foba".
}
\item{steps}{
Number of greedy (forward+backward) steps. Default is the number of variables for forward and backward, and twice the number of variables for foba.
}
\item{intercept}{
If TRUE, an intercept is included in the model (and not penalized),
otherwise no intercept is included. Default is TRUE.
}
\item{nu}{
In range (0,1): controls how likely to take a backward step (more likely when nu is larger). Default is 0.5.
}
\item{lambda}{
Regularization parameter for ridge regression. Default is 1e-5.
}
}

\value{
A "foba" object is returned, which contains the following components:
\item{call}{ The function call resulting to the object}
\item{type}{ Which variable selection method is used}
\item{path}{ The variable selection path: a sequence of variable addition/deletions}
\item{beta}{ Coefficients (ridge regression solution) at each step with selected features}
\item{meanx}{ Zero if intercept=FALSE, and the mean of x if intercept=TRUE}
\item{meany}{ Zero if intercept=FALSE, and the mean of y if intercept=TRUE}
}
\details{
FoBa for least squares regression is described in [Tong Zhang (2008)].
This implementation supports ridge regression.
The "foba" method takes a backward step when the ridge penalized risk increase is less than nu times the ridge penalized risk reduction in the corresponding backward step. The "foba.conservative" method takes a backward step when the risk increase is less than nu times the smallest risk reduction in all previous forward steps. The "foba.aggressive" method takes a backward step when the cumulative risk changes in backward step is less than nu times the changes in the forward steps.
}
\references{
Tong Zhang (2008) "Adaptive Forward-Backward Greedy Algorithm for Learning Sparse Representations", Rutgers Technical Report (long version). 

Tong Zhang (2008) "Adaptive Forward-Backward Greedy Algorithm for Sparse Learning with Linear Models", NIPS'08 (short version).
}

\author{Tong Zhang}
\seealso{
print.foba and predict.foba methods for foba
}

\examples{
data(boston)

model.foba <- foba(boston$x,boston$y,steps=20)
print(model.foba)

model.foba.a <- foba(boston$x,boston$y,type="foba.a",steps=20) # Can use abbreviations
print(model.foba.a)

model.for <- foba(boston$x,boston$y,type="for",steps=20) 
print(model.for)

model.back <- foba(boston$x,boston$y,type="back") # Use only first 20 variables
print(model.back)


}

\keyword{regression}
\keyword{models}
\keyword{optimize}




