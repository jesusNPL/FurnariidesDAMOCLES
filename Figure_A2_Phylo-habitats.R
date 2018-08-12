library(diversitree)
library(phytools)
require(ape)
library(geiger)

colores <- list(NH = c("azure", "gray"),
                Forest = c("azure", "palegreen4"),
                Open = c("azure", "Khaki"))

colores_legend <- c("gray", "palegreen4", "Khaki")


fur_phy <- read.nexus("furna_divTime_WO_MCC_newNames.nex")
plot(fur_phy, show.tip.label = FALSE)

fur_habitats <- read.csv("furnariides_PA_allnew_by_habitat.csv", row.names = 1)
dim(fur_habitats)

#fur_phy$Habitats <- fur_data[,1:2]
#head(fur_phy$Habitats)
fur_data <- treedata(fur_phy, fur_habitats, sort = TRUE)

fur_phy2 <- fur_data$phy
fur_habitats2 <- fur_data$data
head(fur_habitats2)
write.csv(fur_habitats2, "Furnariides_habitats.csv")

habitats <- read.csv("Furnariides_habitats.csv", row.names = 1)
head(habitats)

fur_phy2$Habitats <- habitats[, 1:3]

pdf("Figure_Phylo_furnariides.pdf", 10, 10)
par((xpd = TRUE), oma = c(1, 0, 1, 1))
trait.plot(fur_phy2, fur_phy2$Habitats, cols = colores, font = 1, cex.lab = 0.001, 
           legend = FALSE, w = .05)
#mtext("Furnariides by habitat", side = 3)

legend("bottomright", xpd = TRUE,
       c("NH", "Forest habitat", "Open habitat"),
       col = colores_legend, pch = 15, cex = 1, pt.cex = 2.5, bty = "n")
dev.off()

