



##### BoxPlot comparing SR, MPD, DRC between habitats

nombres <- c("Forest", "Open")
bks <- seq(0, 80, by = 20)

tiff(filename = "boxplot_rs_mpd_drc.tif", width = 15, height = 18, units = "cm", 
     pointsize = 12, compression = "lzw", bg = "white", res = 600)

par(mfrow = c(3, 1))
#par(oma = c(1, 6, 1, 4))
#par(mar = c(2, 5, 1, 1))
par(oma = c(2, 3, 2, 1))
par(mar = c(3, 5, 2, 1))
par(cex.axis = 1.5)
par(cex.lab = 1.5)
col1 <- c("black", "gray")

#Richness
boxplot(dam_fo2$SR, dam_op$SR, ylim = c(0.0, 80),  ylab = "SR", line = 1, breaks = bks)
text(2.5, 73, "(a)", cex = 1.5)

#MPD
boxplot(dam_fo2$MPD, dam_op$MPD, ylim = c(-2.0, 11.0),  ylab = "SES-MPD", line = 1)
text(2.5, 9.8, "(b)", cex = 1.5)

#DRC
boxplot(fo_dr$DRC, op_dr$DRC, ylim = c(0.0, 0.6), ylab = "DRC", names = nombres, line = 1)
text(2.5, 0.55, "(c)", cex = 1.5)
#title(xlab = "Diversification scenarios", ylab = "AIC Weights", 
#      outer = T, line = 0.5, cex = 4, font = 2, cex.lab = 2)

dev.off()
