selectPval <- function(drug_disease_net,pval_thr,filename_out){
  
  ind <- which(is.na(drug_disease_net$pval))
  if(length(ind)>0) drug_disease_net <- drug_disease_net[-ind,]
  
  ind <- which(drug_disease_net$pval > pval_thr)
  
  if(length(ind)>0) drug_disease_net <- drug_disease_net[-ind,]
  
  write.table(drug_disease_net, filename_out, sep = "\t", row.names = F, col.names = T, quote = F)
  
  return(drug_disease_net)
  
}