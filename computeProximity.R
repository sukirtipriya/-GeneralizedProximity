computeProximity <- function(list1,list2,graph_info,metric){
  
  graph <- graph_info$graph
  node <- graph_info$node
  
  from <- which(node %in% list1)
  to <- which(node %in% list2)
  
  distance_matrix <- distances(graph, v = V(graph)[from], to = V(graph)[to])
  
  if(metric == "min"){
    minimum <- computeMinimum(distance_matrix)
    proximity<- mean(minimum, na.rm = T)
    
  }else if (metric == "median"){
    median_value <- computeMedian(distance_matrix)
    proximity<- mean(median_value, na.rm = T)
    
  }else if(metric == "mean"){
    mean_value <- computeMean(distance_matrix)
    proximity <- mean(mean_value, na.rm = T)
    
  }else if(metric == "max"){
    maximum <- computeMax(distance_matrix)
    proximity <- mean(maximum, na.rm = T)
    
  }else if(metric == "mode"){
    mode_value <- computeMode(distance_matrix)
    proximity <- mean(mode_value, na.rm = T)
    
  }
  
  return(proximity)
  
}

