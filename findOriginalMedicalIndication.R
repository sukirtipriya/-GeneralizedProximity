findOriginalMedicalIndication <- function(known_association, predicted_association, filename_out_onlabel){
  
  df <- merge(known_association, predicted_association, by = "drug", all = F)
  df <- df[,c("TTD_association","drug","proximity","zscore","pval","disease")]
  
  write.table(df, filename_out_onlabel, row.names = F, col.names = T, sep = "\t", quote = F)
  
  return(df)
  
}
