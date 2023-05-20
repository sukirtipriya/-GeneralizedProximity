mainNetwork <- function(){
  
  ########################################
  # input parameters
  diseases <- input_parameter$diseases
  thr_pval <- input_parameter$thr_pval
  
  # input files
  interactome <- input_file$interactome
  disease_gene <- input_file$disease_gene
  drug_target <- input_file$drug_target
  known_association <- input_file$known_association
  
  # output files
  filename_out_min <- output_file$filename_out_min
  filename_out_mean <- output_file$filename_out_mean
  filename_out_median <- output_file$filename_out_median
  filename_out_max <- output_file$filename_out_max
  filename_out_mode <- output_file$filename_out_mode
  
  filename_out_drug_info <- output_file$filename_out_drug_info
  filename_out_disease_info  <- output_file$filename_out_disease_info
  
  filename_out_onlabel_min <- output_file$filename_out_onlabel_min
  filename_out_onlabel_mean <- output_file$filename_out_onlabel_mean
  filename_out_onlabel_median <- output_file$filename_out_onlabel_median
  filename_out_onlabel_max <- output_file$filename_out_onlabel_max
  filename_out_onlabel_mode <- output_file$filename_out_onlabel_mode
  ########################################
  
  graph_info <- getGraph(interactome)
  
  list_disease <- split(disease_gene,disease_gene$disease)
  list_disease <- list_disease[diseases]
  
  n_gene <- sapply(list_disease,nrow)
  disease_info <- data.frame(disease = names(n_gene),n_gene = n_gene)
  disease_info <- disease_info[order(disease_info$n_gene),]
  
  list_drug <- split(drug_target,drug_target$Drug)
  
  n_target <- sapply(list_drug,nrow)
  ind <- which(n_target > 1)
  list_drug <- list_drug[ind]
  
  drug_info <- data.frame(drug = names(n_target)[ind], n_target = n_target[ind])
  drug_info <- drug_info[order(drug_info$n_target),]
  
  write.table(drug_info, filename_out_drug_info, sep = "\t", row.names = F, col.names = T, quote = F)
  write.table(disease_info, filename_out_disease_info, sep = "\t", row.names = F, col.names = T, quote = F)
  ########################################
  
  drug_disease_net_min <- getDrugDiseaseNetwork(list_disease,list_drug,graph_info,
                                                metric="min",thr_pval,known_association,
                                                filename_out_min,filename_out_onlabel_min)

  drug_disease_net_mean <- getDrugDiseaseNetwork(list_disease,list_drug,graph_info,
                                                metric="mean",thr_pval,known_association,
                                                filename_out_mean,filename_out_onlabel_mean)

  drug_disease_net_median <- getDrugDiseaseNetwork(list_disease,list_drug,graph_info,
                                                 metric="median",thr_pval,known_association,
                                                 filename_out_median,filename_out_onlabel_median)

  drug_disease_net_max <- getDrugDiseaseNetwork(list_disease,list_drug,graph_info,
                                                   metric="max",thr_pval,known_association,
                                                   filename_out_max,filename_out_onlabel_max)
  
  drug_disease_net_mode <- getDrugDiseaseNetwork(list_disease,list_drug,graph_info,
                                                   metric="mode",thr_pval,known_association,
                                                   filename_out_mode,filename_out_onlabel_mode)
  
  ########################################
  
  res <- list(drug_disease_net_min = drug_disease_net_min,
              drug_disease_net_mean = drug_disease_net_mean,
              drug_disease_net_median = drug_disease_net_median,
              drug_disease_net_max = drug_disease_net_max,
              drug_disease_net_mode = drug_disease_net_mode)
  
  
  
  return(res)
}


