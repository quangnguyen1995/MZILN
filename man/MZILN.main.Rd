% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MZILN_main.R
\name{MZILN.main}
\alias{MZILN.main}
\title{MZILN (Multivariate Zero inflated Logistic Normal Regression)}
\usage{
MZILN.main(df.main, df.covar, covariates = colnames(df.covar),
  n.lam = 200, lam.min.ratio = 1e-04, reg.method = "mcp",
  n.folds = 5)
}
\arguments{
\item{df.main}{Data frame of relative abundance data}

\item{df.covar}{Data frame of covariate data}

\item{covariates}{Specific covariates of interest. The default is all covariates
in \code{df.covar}}

\item{n.lam}{Number of \code{lambda} values to control the regularization as documented
in \code{PICASSO}. The default is 200.}

\item{lam.min.ratio}{Ratio between the upper and lower bound of generated \code{lambda} values.
The default is 0.0001.}

\item{reg.method}{The method of regularization. The default is \code{mcp}. Other options
include \code{lasso} and \code{scad}}

\item{n.folds}{The number of cross-validation folds. The default is 5.}
}
\value{
A list containing: \code{results} - a data frame of regression coefficients for each
    covariate of interest (as columns) per taxa (as rows); and \code{crossvalidation} - a data
    frame of each \code{lambda} value and the mean MSE of each value across cross validation folds
}
\description{
ZILN is based upon the Zero Inflated Logistic Normal Regression
for microbiome relative abundance data prepared by Dr. Zhigang Li.
}
\examples{
data(test.main)
data(test.covariates)
MZILN.obj <- MZILN.main(test.main, test.covariates, covariates = c("covar1","covar4"),
                          n.lam = 200, lam.min.ratio = 0.0001, reg.method = "mcp", n.folds = 5)
#accessing the results - beta values of covariates per taxa
MZILN.obj$results
#Plotting the crossvalidation results for 5 fold cross validation
plot(MZILN.obj$crossvalidation)

}
\references{
Douglas Bates and Martin Maechler (2017). Matrix: Sparse and Dense Matrix
Classes and Methods. R package version 1.2-12.\url{https://CRAN.R-project.org/package=Matrix}

Jason Ge, Xingguo Li, Mengdi Wang, Tong Zhang, Han Liu and Tuo Zhao
(2017). picasso: Pathwise Calibrated Sparse Shooting Algorithm. R package
version 1.2.0. \url{https://CRAN.R-project.org/package=picasso}

Vincent Goulet, Christophe Dutang, Martin Maechler, David Firth, Marina
Shapira and Michael Stadelmann (2017). expm: Matrix Exponential, Log,
'etc'. R package version 0.999-2. \url{https://CRAN.R-project.org/package=expm}
}
