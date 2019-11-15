#' This scrip loads the model created in the previous file and defines the function that
#' will tun the *Plumber API* so we can predict if a given transaction is fraud or nor.
#' 

library(mlr)
library(stringr)


model <- readRDS("./output/model_best.rds") # To change when pushed from other machine

#* @get /is_fraud
get_predict_fraud <- function(pars){
  
  names <- model$features
  input <- as.numeric(stringr::str_split_fixed(pars,",",30))
  new_data <- data.frame(t(input))
  names(new_data) <- names
  
  predict(model,newdata = new_data)$data
  
  
}

