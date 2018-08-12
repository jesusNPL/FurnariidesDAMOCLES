load("EXTINC_COLON_sesMPD_DR_description_final.RData")

## Models

# General model extinction and 
cor.test(log(dat2$mu), log(dat2$gamma_0))
cor.test(log(dam_fo2$Mu), log(dam_fo2$Gamma))
cor.test(log(dam_op$Mu), log(dam_op$Gamma))

mod <- lm(log(dat2$Extinction) ~ log(dat2$Colonization))
summary(mod)

mod1 <- lm(log(forest$Extinction) ~ log(forest$Colonization))
summary(mod1)

mod2 <- lm(log(open$Extinction) ~ log(open$Colonization))
summary(mod2)
## Plot regressions

tiff(filename = "regressions_mu_gamma_final2.tif", width = 14, height = 12, units = "cm", 
     pointsize = 12, compression = "lzw", bg = "white", res = 300)

#par(mfrow = c(3, 1))
#par(oma = c(3, 4, 1, 3))
#par(mar = c(3, 3, 1, 1))
par(oma = c(1, 1, 0, 0))
#par(mar = c(2, 2, 2, 1))
par(cex.axis = 0.9)
par(cex.lab = 0.9)

plot((log(dat2$Extinction) ~ log(dat2$Colonization)), pch = 16, col = "black", 
     xlab = "", ylab = "")
#abline(mod, lwd = 2)
#text(-5.8, 3.5, "(a)", cex = 1.5)

points((log(forest$Extinction) ~ log(forest$Colonization)), pch = 16, col = "palegreen4", 
     xlab = "", ylab = "")
abline(mod1, lwd = 2, col = "palegreen4")
#text(-5.8, 3.5, "(b)", cex = 1.5)

points((log(open$Extinction) ~ log(open$Colonization)), pch = 16, col = "khaki", 
     xlab = "", ylab = "")
abline(mod2, lwd = 2, col = "khaki")
#text(-4.9, 3.5, "(c)", cex = 1.5)

title(xlab = "Colonization rates (γ)", ylab = "Local extinction rates (μ)", 
      outer = T, line = -2, cex = 1, font = 2, cex.lab = 1)

legend(-6.1, 4.4, legend = c("Forest", "Open"), col = c("palegreen4", "Khaki"), 
       lty = 1.5, cex = 0.8, pch = c(19, 19), box.lty = 0)

dev.off()

save.image("plotRegressions_final.RData")


setEPS()
postscript("regressions_mu_gamma_final2.eps", encoding = "ISOLatin1.enc")
#par(mfrow = c(3, 1))
#par(oma = c(3, 4, 1, 3))
#par(mar = c(3, 3, 1, 1))
par(oma = c(1, 1, 0, 0))
#par(mar = c(2, 2, 2, 1))
par(cex.axis = 0.9)
par(cex.lab = 0.9)

plot((log(dat2$Extinction) ~ log(dat2$Colonization)), pch = 16, col = "black", 
     xlab = "", ylab = "")
#abline(mod, lwd = 2)
#text(-5.8, 3.5, "(a)", cex = 1.5)

points((log(forest$Extinction) ~ log(forest$Colonization)), pch = 16, col = "palegreen4", 
       xlab = "", ylab = "")
abline(mod1, lwd = 2, col = "palegreen4")
#text(-5.8, 3.5, "(b)", cex = 1.5)

points((log(open$Extinction) ~ log(open$Colonization)), pch = 16, col = "khaki", 
       xlab = "", ylab = "")
abline(mod2, lwd = 2, col = "khaki")
#text(-4.9, 3.5, "(c)", cex = 1.5)

#title(xlab = "Colonization rates (γ)", ylab = "Local extinction rates (μ)", 
 #     outer = T, line = -2, cex = 1, font = 2, cex.lab = 1)
title(xlab = expression(paste("Colonization rates ", (gamma))), 
      ylab = expression(paste("Local extinction ", (mu))), outer = TRUE, line = -2, 
      cex = 1, font = 2, cex.lab = 1)

legend(-6.1, 4.4, legend = c("Forest", "Open"), col = c("palegreen4", "Khaki"), 
       lty = 1.5, cex = 0.8, pch = c(19, 19), box.lty = 0)

dev.off()


