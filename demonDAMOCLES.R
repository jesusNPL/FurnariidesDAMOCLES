setwd("/home/users/JesusNPL/Damocles_run_cluster")

require("parallel")
library("doParallel")
library("DAMOCLES")
library("picante")
library("snow")
source("https://raw.githubusercontent.com/csdambros/R-functions/master/passSSHid.R")

passSSHid()
# Load your community dataset
comms <- read.table("furnariides_PA_allnew.txt", header = T, row.names = 1)
# Load your phylogeny
tree <- read.nexus("furna_divTime_WO_MCC_newNames.nex")
# Match the community dataset with your phylogeny
matched2 <- match.phylo.comm(phy = tree, comm = t(comms))


##### Function to run in parallel #####

DemonDAMOCLES <- function(tree, comm, initparsopt, idparsopt, parsfix, idparsfix, 
                         pars2, pchoice, runs, estimate_pars, conf.int){
  
  #n.cores <- detectCores()-2
  #n.cores <- makeCluster(15)
  cl <- makeCluster(25)
  #cl <- makeMPIcluster(25)
  clusterExport(cl, "matched2")
  dat <- lapply(c(1:length(row.names(comm))), 
                function(x) cbind(row.names(t(comm)), as.matrix(as.numeric(comm[x,]))));
  out2 <- parallel::parLapply(cl = cl, X = dat,
                      function(x) DAMOCLES::DAMOCLES_bootstrap(phy = tree, pa = x, 
                                                               initparsopt, 
                                                               idparsopt, parsfix, 
                                                               idparsfix, pars2, 
                                                               pchoice, runs, 
                                                               estimate_pars, 
                                                               conf.int));
  stopCluster(cl)
  return(out2)
}
}

# Run Damocles model using matched information
BootsDAMAll <- DemonDAMOCLES(tree = matched2[[1]], comm = matched2[[2]], initparsopt = c(0.05, 0.05), 
                  parsfix = c(0), idparsfix = c(3),
                  idparsopt = c(1, 2), pars2 = c(1E-3, 1E-4, 1E-5, 10000), pchoice = 0,
                  runs = 1000, estimate_pars = TRUE, conf.int = 0.95)

