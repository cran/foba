\name{predict.foba}
\alias{predict.foba}
\title{
Make predictions or extract coefficients from a fitted foba model
}
\description{
foba() returns a path of variable addition and deletion.
predict.foba() allows one to extract a prediction, or coefficients at any desired sparsity level.
}
\usage{
predict.foba(object, newx, k, type=c("fit","coefficients"),...)
}
\arguments{
\item{object}{
A fitted foba object.
}
\item{newx}{
If type="fit", then newx should be the x values at which the fit is required.
If type="coefficients", then newx can be omitted.
}
\item{k}{
The sparsity level. That is, the number of selected variables for the fitted model.
}
\item{type}{
If type="fit", predict returns the fitted values. If
type="coefficients", predict returns the coefficients.
Abbreviations allowed.
}
\item{...}{further arguments passed to or from other methods.}
}
\value{
Return either a "coefficients" object or a "fitted value" object,
at the desired sparsity level.

A coefficients object is a list containing the following components:
\item{coefficients}{
coefficients of ridge regression solution using selected.variables
}
\item{intercept}{
the intercept value 
}
\item{selected.variables}{
variables with non-zero coefficients
}

A "fitted value" object contains the following additional component:
\item{fit}{
the predicted response for the data newx
}
}

\details{
FoBa for least squares regression is described in [Tong Zhang (2008)].
This implementation supports ridge regression.
}
\references{
Tong Zhang (2008) "Adaptive Forward-Backward Greedy Algorithm for Learning Sparse Representations", Rutgers Technical Report (long version). 

Tong Zhang (2008) "Adaptive Forward-Backward Greedy Algorithm for Sparse Learning with Linear Models", NIPS'08 (short version).
}

\author{Tong Zhang}
\seealso{
print.foba and foba
}

\examples{
data(boston)

model <- foba(boston$x,boston$y,s=20,nu=0.9)

### make predictions at the values in x, at sparsity level 5

py <- predict(model, boston$x, k=5, type="fit")

print(paste("mean squared error =", mean((py$fit-boston$y)^2)))

### extract the coefficient vector at sparsity level 5
coef <- predict(model, k=5, type="coef")
print("top five variables:")
coef$selected.variables

}
\keyword{regression}
\keyword{methods}

