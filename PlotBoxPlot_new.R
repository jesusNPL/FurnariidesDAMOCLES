

##### BoxPlot comparing SR, MPD, DRC between habitats

nombres <- c("Forest", "Open")
bks <- seq(0, 80, by = 20)

tiff(filename = "boxplot_rs_mpd_mntd_drc_final2.tif", width = 25, height = 15, 
     units = "cm", pointsize = 12, compression = "lzw", bg = "white", res = 300)

par(mfrow = c(1, 4))
#par(oma = c(1, 6, 1, 4))
#par(mar = c(2, 5, 1, 1))
par(oma = c(2, 2, 2, 1))
par(mar = c(3, 5, 2, 1))
par(cex.axis = 1.5)
par(cex.lab = 1.5)
col1 <- c("palegreen4", "Khaki")

#Richness
boxplot(data2$Richness ~ data2$Habitat, data = data2, ylim = c(0.0, 80),  
        ylab = "Species richness", line = 1, breaks = bks, col = col1)
text(2.4, 80, "(a)", cex = 1.5)

#MPD
boxplot(data2$mpd.obs.z.DAMOCLES ~ data2$Habitat, data = data2, ylim = c(-2.0, 11.0),  
        ylab = "SES-MPD", line = 1, col = col1)
#abline(h = -1.96, col = "black", lwd = 1)
#abline(h = 1.96, col = "black", lwd = 1)
text(2.4, 10.9, "(b)", cex = 1.5)

#MNTD
boxplot(data2$mntd.obs.z.DAMOCLES ~ data2$Habitat, data = data2, ylim = c(-2.0, 4),  
        ylab = "SES-MNTD", line = 1, col = col1)
text(2.4, 4, "(c)", cex = 1.5)

#DRC
boxplot(data2$meanDR ~ data2$Habitat, data = data2 , ylim = c(0.0, 0.3), 
        ylab = "Diversification rate", line = 1, col = col1)
text(2.4, 0.30, "(d)", cex = 1.5)
#title(xlab = "Diversification scenarios", ylab = "AIC Weights", 
#      outer = T, line = 0.5, cex = 4, font = 2, cex.lab = 2)

dev.off()




nombres <- c("Forest", "Open")
bks <- seq(0, 80, by = 20)

setEPS()
postscript("boxplot_rs_mpd_mntd_drc_final2.eps", width = 10, height = 7)

par(mfrow = c(1, 4))
#par(oma = c(1, 6, 1, 4))
#par(mar = c(2, 5, 1, 1))
par(oma = c(2, 2, 2, 1))
par(mar = c(3, 5, 2, 1))
par(cex.axis = 1.5)
par(cex.lab = 1.5)
col1 <- c("palegreen4", "Khaki")

#Richness
boxplot(data2$Richness ~ data2$Habitat, data = data2, ylim = c(0.0, 80),  
        ylab = "Species richness", line = 1, breaks = bks, col = col1)
text(2.4, 80, "(a)", cex = 1.5)

#MPD
boxplot(data2$mpd.obs.z.DAMOCLES ~ data2$Habitat, data = data2, ylim = c(-2.0, 11.0),  
        ylab = "SES-MPD", line = 1, col = col1)
#abline(h = -1.96, col = "black", lwd = 1)
#abline(h = 1.96, col = "black", lwd = 1)
text(2.4, 10.9, "(b)", cex = 1.5)

#MNTD
boxplot(data2$mntd.obs.z.DAMOCLES ~ data2$Habitat, data = data2, ylim = c(-2.0, 4),  
        ylab = "SES-MNTD", line = 1, col = col1)
text(2.4, 4, "(c)", cex = 1.5)

#DRC
boxplot(data2$meanDR ~ data2$Habitat, data = data2 , ylim = c(0.0, 0.3), 
        ylab = "Diversification rate", line = 1, col = col1)
text(2.4, 0.30, "(d)", cex = 1.5)
#title(xlab = "Diversification scenarios", ylab = "AIC Weights", 
#      outer = T, line = 0.5, cex = 4, font = 2, cex.lab = 2)

dev.off()

