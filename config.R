config <- function(){
  
 
  # diseases <- c("Schizophrenia","Prostatic Neoplasms","Stomach Neoplasms",
  #              "Liver Cirrhosis, Experimental", "Malignant neoplasm of breast")
  
  diseases <- "Liver Cirrhosis, Experimental"
  # pay attention: could take even 12 hours of running for each disease
  #################################
  # parameters for computing end network

  dirRes <- paste0("Results_",diseases,"/")       
  thr_pval <- 0.05
  
  input_parameter <- list(diseases = diseases,
                          dirRes = dirRes,
                          thr_pval = thr_pval
                          )
  
  return(input_parameter)
  
}