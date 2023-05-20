computeMedian <- function(distance_matrix,dim=1,perc_thr=5){

  # dim = 1 -> row mean (ie, from DrugTarget to DiseaseGene), 
  # dim = 2 -> col mean (ie, from DiseaseGene to DrugTarget)
  
  median_value <- apply(distance_matrix,dim,median,na.rm = T)
  
  count <- length(median_value[is.infinite(median_value)])
  
  perc <- ( count / length(median_value) ) *100
  
  if( perc > perc_thr ){
    
    median_value <- median_value
    
  }else{
    
    median_value <- median_value[is.finite(median_value)]
    
  }
  
}