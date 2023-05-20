getSource <- function(){

  # input
  source("src/script/input/config.R")
  source("src/script/input/inputFiles.R")
  
  # output
  source("src/script/output/networkFiles.R")
  
  # compute drug-disease network
  source("src/script/lib/mainNetwork.R")
  source("src/script/lib/getGraph.R")
  source("src/script/lib/getDrugDiseaseNetwork.R")
  source("src/script/lib/computeDrugDiseaseNetwork.R")
  source("src/script/lib/computeDegreeDistribution.R")
  source("src/script/lib/computeProximity.R")
  source("src/script/lib/computeMinimum.R")
  source("src/script/lib/computeMean.R")
  source("src/script/lib/computeMax.R")
  source("src/script/lib/computeMedian.R")
  source("src/script/lib/computeMode.R")
  source("src/script/lib/selectPval.R")
  source("src/script/lib/computeRandomProximity.R")
  source("src/script/lib/selectRandomNodes.R")
  source("src/script/lib/computeStatistics.R")
  
  # find original indication
  source("src/script/lib/findOriginalMedicalIndication.R")
  
}
