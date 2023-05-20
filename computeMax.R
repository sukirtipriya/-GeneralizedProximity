computeMax <- function(distance_matrix,dim=1,perc_thr=5){

  # dim = 1 -> row mean (ie, from DrugTarget to DiseaseGene), 
  # dim = 2 -> col mean (ie, from DiseaseGene to DrugTarget)
  
  maximum <- apply(distance_matrix,dim,function(x){
    
    ind <- which(is.infinite(x))
    
    if(length(ind) != length(x) ) x <- x[-ind]
    
    maximum <- max(x,na.rm = T)
  })
  
  count <- length(maximum[is.infinite(maximum)])
  
  perc <- ( count / length(maximum) ) *100
  
  if( perc > perc_thr ){
    
    maximum <- maximum
    
  }else{
    
    maximum <- maximum[is.finite(maximum)]
    
  }
  
}