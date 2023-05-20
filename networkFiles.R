networkFiles <- function(){
  
  ########################################
  # input parameters
  
  dirRes <- input_parameter$dirRes
  
  ########################################
  if(!file.exists(dirRes)){
    dir.create(dirRes)
  }
  ########################################
  # output files
  filename_out_min <- paste0(dirRes,'DrugDiseaseNetwork_min.txt')
  filename_out_mean <- paste0(dirRes,'DrugDiseaseNetwork_mean.txt')
  filename_out_median <- paste0(dirRes,'DrugDiseaseNetwork_median.txt')
  filename_out_max <- paste0(dirRes,'DrugDiseaseNetwork_max.txt')
  filename_out_mode <- paste0(dirRes,'DrugDiseaseNetwork_mode.txt')
  
  filename_out_drug_info <- paste0(dirRes,'DrugInfo.txt')
  filename_out_disease_info <- paste0(dirRes,'DiseaseInfo.txt')
  
  filename_out_onlabel_min <- paste0(dirRes,'onlabel_indication_min.txt')
  filename_out_onlabel_mean <- paste0(dirRes,'onlabel_indication_mean.txt')
  filename_out_onlabel_median <- paste0(dirRes,'onlabel_indication_median.txt')
  filename_out_onlabel_max <- paste0(dirRes,'onlabel_indication_max.txt')
  filename_out_onlabel_mode <- paste0(dirRes,'onlabel_indication_mode.txt')
  ########################################
  
  output_file <- list(filename_out_min = filename_out_min,
                      filename_out_mean = filename_out_mean,
                      filename_out_median = filename_out_median,
                      filename_out_max = filename_out_max,
                      filename_out_mode = filename_out_mode,
                      filename_out_drug_info = filename_out_drug_info,
                      filename_out_disease_info = filename_out_disease_info,
                      filename_out_onlabel_min = filename_out_onlabel_min,
                      filename_out_onlabel_mean = filename_out_onlabel_mean,
                      filename_out_onlabel_median = filename_out_onlabel_median,
                      filename_out_onlabel_max = filename_out_onlabel_max,
                      filename_out_onlabel_mode= filename_out_onlabel_mode
                      )
  
  return(output_file)
  
}



