

tiff(filename = "histograms_mpd_mntd_final.tif", width = 15, height = 18, 
     units = "cm", pointsize = 12, compression = "lzw", bg = "white", res = 300)

par(mfrow = c(3, 2))
par(oma = c(3, 3, 2, 0))
par(mar = c(3, 3, 1, 0))
#par(oma = c(2, 3, 2, 1))
#par(mar = c(3, 5, 2, 1))
par(cex.axis = 1.2)
par(cex.lab = 1.2)

#MPD
hmpd <- hist(data2$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
#abline(v = -1.96, lwd = 2, lty = 2, col = "black")
cc <- cut(hmpd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hmpd, col =  c("red", "gray", "red")[cc], xlim = c(-2, 11), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("All assemblages", side = 3, line = 0, cex = 0.8)

text(10, 25.5, "(a)", cex = 1.2)
#MNTD
hmntd <- hist(data2$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
#abline(v = -1.96, lwd = 2, lty = 2, col = "black")
cc <- cut(hmntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hmntd, col =  c("red", "gray", "red")[cc], xlim = c(-2, 4), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("All assemblages", side = 3, line = 0, cex = 0.8)


text(3.5, 11, "(b)", cex = 1.2)

## forest assemblages
#MPD
hfompd <- hist(forest$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc2 <- cut(hfompd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hfompd, col =  c("red", "gray", "red")[cc2], xlim = c(-2, 8), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Forest assemblages", side = 3, line = 0, cex = 0.8)

text(7.5, 19.5, "(c)", cex = 1.2)

#mntd
hfomntd <- hist(forest$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc2 <- cut(hfomntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hfomntd, col =  c("red", "gray", "red")[cc2], xlim = c(-2, 3), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Forest assemblages", side = 3, line = 0, cex = 0.8)


text(2.5, 7, "(e)", cex = 1.2)

## open assemblages
#MPD
hopmpd <- hist(open$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc3 <- cut(hopmpd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hopmpd, col =  c("red", "gray", "red")[cc3], xlim = c(-2, 11), 
     xlab = "SES-MPD", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
text(10, 6.5, "(f)", cex = 1.2)
mtext("Open assemblages", side = 3, line = 0, cex = 0.8)

mtext("SES-MPD", side = 1, line = 3)

#MNTD
hopmntd <- hist(open$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc3 <- cut(hopmntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hopmntd, col =  c("red", "gray", "red")[cc3], xlim = c(-2, 4), 
     xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Open assemblages", side = 3, line = 0, cex = 0.8)

text(3.5, 6.5, "(g)", cex = 1.2)
mtext("SES-MNTD", side = 1, line = 3)


title(xlab = "", ylab = "Frequency", 
      outer = T, line = 1, cex = 1.5, font = 2, cex.lab = 1.5)

dev.off()

#save.image("histograms_final.RData")

setEPS()
postscript("histograms_mpd_mntd_final.eps", width = 8, height = 11)
par(mfrow = c(3, 2))
par(oma = c(3, 3, 2, 0))
par(mar = c(3, 3, 1, 0))
#par(oma = c(2, 3, 2, 1))
#par(mar = c(3, 5, 2, 1))
par(cex.axis = 1.2)
par(cex.lab = 1.2)

#MPD
hmpd <- hist(data2$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
#abline(v = -1.96, lwd = 2, lty = 2, col = "black")
cc <- cut(hmpd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hmpd, col =  c("red", "gray", "red")[cc], xlim = c(-2, 11), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("All assemblages", side = 3, line = 0, cex = 0.8)

text(10, 25.5, "(a)", cex = 1.2)
#MNTD
hmntd <- hist(data2$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
#abline(v = -1.96, lwd = 2, lty = 2, col = "black")
cc <- cut(hmntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hmntd, col =  c("red", "gray", "red")[cc], xlim = c(-2, 4), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("All assemblages", side = 3, line = 0, cex = 0.8)


text(3.5, 11, "(b)", cex = 1.2)

## forest assemblages
#MPD
hfompd <- hist(forest$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc2 <- cut(hfompd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hfompd, col =  c("red", "gray", "red")[cc2], xlim = c(-2, 8), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Forest assemblages", side = 3, line = 0, cex = 0.8)

text(7.5, 19.5, "(c)", cex = 1.2)

#mntd
hfomntd <- hist(forest$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc2 <- cut(hfomntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hfomntd, col =  c("red", "gray", "red")[cc2], xlim = c(-2, 3), xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Forest assemblages", side = 3, line = 0, cex = 0.8)


text(2.5, 7, "(e)", cex = 1.2)

## open assemblages
#MPD
hopmpd <- hist(open$mpd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc3 <- cut(hopmpd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hopmpd, col =  c("red", "gray", "red")[cc3], xlim = c(-2, 11), 
     xlab = "SES-MPD", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
text(10, 6.5, "(f)", cex = 1.2)
mtext("Open assemblages", side = 3, line = 0, cex = 0.8)

mtext("SES-MPD", side = 1, line = 3)

#MNTD
hopmntd <- hist(open$mntd.obs.z.DAMOCLES, breaks = 25, plot = F)
cc3 <- cut(hopmntd$breaks, c(-Inf, -1.96, 1.96, Inf))
plot(hopmntd, col =  c("red", "gray", "red")[cc3], xlim = c(-2, 4), 
     xlab = "", ylab = "", main = NULL)
abline(v = 1.96, lwd = 2, lty = 2, col = "black")
abline(v = -1.96, lwd = 2, lty = 2, col = "black")
mtext("Open assemblages", side = 3, line = 0, cex = 0.8)

text(3.5, 6.5, "(g)", cex = 1.2)
mtext("SES-MNTD", side = 1, line = 3)


title(xlab = "", ylab = "Frequency", 
      outer = T, line = 1, cex = 1.5, font = 2, cex.lab = 1.5)

dev.off()

