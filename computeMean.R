computeMean <- function(distance_matrix,dim=1,perc_thr=5){
  
  # dim = 1 -> row mean (ie, from DrugTarget to DiseaseGene), 
  # dim = 2 -> col mean (ie, from DiseaseGene to DrugTarget)
  
  mean_value <- apply(distance_matrix,dim,function(x){
    
    ind <- which(is.infinite(x))
    
    if(length(ind) != length(x) ) x <- x[-ind]
    
    mean_value <- mean(x,na.rm = T)
  })
  
  count <- length(mean_value[is.infinite(mean_value)])
  
  perc <- ( count / length(mean_value) ) *100
  
  if( perc > perc_thr ){
    
    mean_value <- mean_value
    
  }else{
    
    mean_value <- mean_value[is.finite(mean_value)]
    
  }
  
}