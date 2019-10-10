// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// generate_feature
NumericMatrix generate_feature(NumericVector encoding, int K);
RcppExport SEXP _dependlab_generate_feature(SEXP encodingSEXP, SEXP KSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type encoding(encodingSEXP);
    Rcpp::traits::input_parameter< int >::type K(KSEXP);
    rcpp_result_gen = Rcpp::wrap(generate_feature(encoding, K));
    return rcpp_result_gen;
END_RCPP
}
// generate_feature_armadillo
Rcpp::NumericMatrix generate_feature_armadillo(arma::vec encoding, int K);
RcppExport SEXP _dependlab_generate_feature_armadillo(SEXP encodingSEXP, SEXP KSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::vec >::type encoding(encodingSEXP);
    Rcpp::traits::input_parameter< int >::type K(KSEXP);
    rcpp_result_gen = Rcpp::wrap(generate_feature_armadillo(encoding, K));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_dependlab_generate_feature", (DL_FUNC) &_dependlab_generate_feature, 2},
    {"_dependlab_generate_feature_armadillo", (DL_FUNC) &_dependlab_generate_feature_armadillo, 2},
    {NULL, NULL, 0}
};

RcppExport void R_init_dependlab(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}