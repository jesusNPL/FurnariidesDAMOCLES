library(DAMOCLES)
library(picante)

##### Prepare data #####

DuskyTree <- read.tree("your_tree.phy")
comm <- read.csv("comm_phylo.csv", header = TRUE)
comm_sp <- subset(comm, select = -c(elev, Longitude, Latitude, N))

## Match phylogenetic and community data
matched2 <- match.phylo.comm(phy = DuskyTree, comm = comm_sp)

comNAMES <- as.character(comm_sp$site)

# Just trying with a single community
tr <- matched2$phy
coms <- t(matched2$comm)
com1 <- as.matrix(cbind(matrix(rownames(coms)), matrix(coms[, 10])))

x <- DAMOCLES_bootstrap(phy = tr, pa = com1, 
                        initparsopt = c(0.05, 0.05),
                   idparsopt = c(1, 2), parsfix = NULL, #idparsfix = c(3),
                    pars2 = c(0.001, 1e-04, 1e-05, 10000),
                   pchoice = 0, runs = 100, estimate_pars = TRUE, conf.int = 0.95)


## Example using a simple FOR loop to run DAMOCLES for all communities

# Split communities
comLST <- list()
for(i in 1:ncol(coms)){
  comLST[[i]] <- as.matrix(cbind(matrix(rownames(coms)), matrix(coms[, i])))
}
names(comLST) <- comNAMES

# Alternative 1 - using for loop

DAMOCLESall <- list()

for(j in 1:length(comNAMES)){
  print(comNAMES[j])
  DAMOCLESall[[j]] <- DAMOCLES_bootstrap(phy = tr, pa = comLST[[j]], 
                                         initparsopt = c(0.1, 0.1),
                                         idparsopt = c(1, 2), parsfix = NULL, #idparsfix = c(3),
                                         pars2 = c(0.001, 1e-04, 1e-05, 10000),
                                         pchoice = 0, runs = 1000, estimate_pars = TRUE, 
                                         conf.int = 0.95)
}

save(list = c("comLST", "DAMOCLESall"), file = "Results")

# Alternative 2 - using lapply function from {pbapply}

DAMOCLESall <- pbapply::pblapply(comLST, function(x) DAMOCLES::DAMOCLES_bootstrap(phy = tr, pa = x, 
                                                                                  initparsopt = c(0.1, 0.1),
                                                                                  idparsopt = c(1, 2), parsfix = NULL,
                                                                                  pars2 = c(0.001, 1e-04, 1e-05, 10000),
                                                                                  pchoice = 0, runs = 1000, estimate_pars = TRUE, 
                                                                                  conf.int = 0.95)
)

# Alternative 3 - using parallelized lapply function from {future.apply} 

library("future.apply")
plan(multisession) ## Run in parallel on local computer

DAMOCLESall <- future.apply::future_lapply(comLST, function(x) DAMOCLES::DAMOCLES_bootstrap(phy = tr, pa = x, 
                                                                                  initparsopt = c(0.1, 0.1),
                                                                                  idparsopt = c(1, 2), parsfix = NULL,
                                                                                  pars2 = c(0.001, 1e-04, 1e-05, 10000),
                                                                                  pchoice = 0, runs = 1000, estimate_pars = TRUE, 
                                                                                  conf.int = 0.95)
)
