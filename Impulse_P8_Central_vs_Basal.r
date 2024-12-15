library(ImpulseDE2)

setwd("/jic/scratch/groups/Cristobal-Uauy/mjones/spike_dev_timecourse_analyses/ImpulseDE2/P8_top_vs_bottom")
annotation <- read.csv("pol_spikes_annotation_P8NIL_top_vs_bottom_NO_BATCH.csv", header=TRUE, row.names=1)
counts <- read.csv("../pol_spikes_counts.csv", header=TRUE, row.names=1)
counts  <- as.matrix(counts)

objectImpulseDE2 <- runImpulseDE2(
  matCountData    = counts, 
  dfAnnotation    = annotation,
  boolCaseCtrl    = TRUE, #case control analysis? Yes in this case, so = TRUE
  vecConfounders  = NULL, #factors to account for on batch correction? In this case, no.  
  scaNProc        = 4 ) #number of processes for parallelisation

#Save vecDEgenes (genes identified as differentially expressed by ImpusleDE at threshold scaQThres)
write.csv(objectImpulseDE2$VecDEgenes, "pol_spikes_P8_top_vs_bottom_impulseDE2_vecDEGenes.csv")

#Save dfDEAnalysis (dataframe of samples x reported characteristics)
write.csv(objectImpulseDE2$dfDEAnalysis, "pol_spikes_P8_top_vs_bottom_impulseDE2_DEAnalysis.csv")

#Save dfImpulseDE2Results (dataframe of results per gene such as p, padj, loglik)
write.csv(objectImpulseDE2$dfImpulseDE2Results, "pol_spikes_P8_top_vs_bottom_impulseDE2_results.csv")
