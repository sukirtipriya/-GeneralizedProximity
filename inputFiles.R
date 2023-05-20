inputFiles <- function(){
  
  ########################################
  # interactome
  interactome <- read.table("input_files/interactome_Feixiong2018.txt", header = T, sep = '\t', check.names = F, quote = "")
  
  # disease gene
  disease_gene <- read.table("input_files/DisGeNET.txt", header = T, sep = '\t', check.names = F, quote = "")
  disease_gene <- unique(disease_gene)
  disease_gene$disease <- gsub(pattern = "\"", x = disease_gene$disease, replacement = "")
  
  # drug target 
  drug_target <- read.table("input_files/DrugBank.txt", header = T, sep = '\t', check.names = F, quote = "")
  drug_target <- unique(drug_target)
  drug_target$Drug <- tolower(drug_target$Drug)
  
  # TTD association
  known_association <- read.table("input_files/TTD_association.txt", sep = "\t", header = T, check.names = F, quote = "")
  colnames(known_association) <- c("TTD_association","drug")
  ########################################
  
  input_file <-list(interactome = interactome,
                    disease_gene = disease_gene,
                    drug_target = drug_target,
                    known_association =  known_association)
  
  return(input_file)
  
}
