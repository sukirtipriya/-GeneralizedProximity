getDrugDiseaseNetwork <- function(list_disease,list_drug,graph_info,
                                  metric,thr_pval,known_association,
                                  filename_out,filename_out_onlabel){
  
  drug_disease_net <- computeDrugDiseaseNetwork(list_disease,list_drug,graph_info, metric)
  
  drug_disease_net <- drug_disease_net[is.finite(drug_disease_net$proximity),]
  
  drug_disease_net <- selectPval(drug_disease_net,thr_pval,filename_out)
  
  onLabel_min <- findOriginalMedicalIndication(known_association,drug_disease_net,filename_out_onlabel)
  
  return(drug_disease_net)
}
