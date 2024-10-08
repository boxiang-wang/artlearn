% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ART_I_AM.R
\name{ART_I_AM}
\alias{ART_I_AM}
\title{ART_I_AM: ART-Integrated-Aggregrating Machines}
\usage{
ART_I_AM(X, y, X_aux, y_aux, X_test, lam = 1, maxit = 5000L, eps = 1e-06, ...)
}
\arguments{
\item{X}{A matrix for the primary dataset (target domain) predictors.}

\item{y}{A vector for the primary dataset (target domain) responses.}

\item{X_aux}{A list of matrices for the auxiliary datasets (source domains) predictors.}

\item{y_aux}{A list of vectors for the auxiliary datasets (source domains) responses.}

\item{X_test}{A matrix for the test dataset predictors.}

\item{lam}{A regularization parameter for weighting the auxiliary models. Default is 1.}

\item{maxit}{The maximum number of iterations for the aggregation process. Default is 5000.}

\item{eps}{A convergence threshold for stopping the iterations. Default is 1e-6.}

\item{...}{Not used in ART_I_AM.}
}
\value{
A list containing:
\item{pred_ART}{The predictions for the test dataset aggregated from the different models and datasets.}
\item{W_ART}{The final weights for each model and dataset combination.}
\item{iter_ART}{The number of iterations performed until convergence.}
}
\description{
`ART_I_AM` performs adaptive and robust transfer learning through the aggregration of multiple machine learning models, 
specifically random forests, AdaBoost, and neural networks. This method aggregates the predictions from these models 
across multiple auxiliary datasets and the primary dataset to enhance model performance on the primary task. 
Users do not need to specify the models in the function, while the framework is general and users can write 
their own function integrating other machine learning models.
}
\details{
The `ART_I_AM` function automatically integrates three machine learning models:
- Random Forest (`fit_rf`)
- AdaBoost (`fit_gbm`)
- Neural Network (`fit_nnet`)

These models are applied to both the primary dataset and auxiliary datasets. The function aggregates the predictions 
of each model using adaptive weights determined by the exponential weighting scheme. The aggregation improves the prediction
power by considering different models and data simultaneously.
}
\examples{
# Generate synthetic datasets for transfer learning
dat <- generate_data(n0=50, K=2, nk=50, p=5, 
                     mu_trgt=1, xi_aux=0.5, ro=0.3, err_sig=1, is_test=TRUE, task="classification")
\dontrun{
# Fit ART_I_AM aggregating three models (random forest, AdaBoost, and neural network)
fit <- ART_I_AM(X = dat$X, y = dat$y, X_aux = dat$X_aux, y_aux = dat$y_aux, X_test = dat$X_test)

# View the predictions and weights
fit$pred_ART
fit$W_ART
}

}
