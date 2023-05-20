computeMode <- function(distance_matrix,dim=1,perc_thr=5){
  
  # dim = 1 -> row mean (ie, from DrugTarget to DiseaseGene)
  # dim = 2 -> col mean (ie, from DiseaseGene to DrugTarget)
  
  mode_value <- apply(distance_matrix,dim,function(x){
    
    mode <- Mode(x,na.rm = T)
    mode <- min(mode)
    
    })
  
  count <- length(mode_value[is.infinite(mode_value)])
  
  perc <- ( count / length(mode_value) ) *100
  
  if( perc > perc_thr ){
    
    mode_value <- mode_value
    
  }else{
    
    mode_value <- mode_value[is.finite(mode_value)]
    
  }
  
}