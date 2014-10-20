require(spatstat)

fit <- ppm(bei ~ polynom(grad, elev, 2), data=bei.extra)

## terrain coloured by predicted intensity
png("../images/beifit.png", 360, 240)
par(mar=rep(0,4))
lam <- predict(fit)
M <- persp(bei.extra$elev, colin=lam,
           colmap=topo.colors(512),
           theta=-55, phi=25, expand=6, shade=0.4, 
           box=FALSE, apron=TRUE, visible=TRUE,
           main="")
perspPoints(bei, Z=bei.extra$elev, M=M, pch=".", col="red", cex=1.25)
dev.off()

## terrain coloured by residual from fitted model
png("../images/beires.png", 360, 240)
par(mar=rep(0,4))
res <- Smooth(residuals(fit, type="p"))
ra <- range(res)
M <- persp(bei.extra$elev, colin=res,
           colmap=colourmap(beachcolours(ra), range=ra),
           theta=-55, phi=25, expand=6, shade=0.4, 
           box=FALSE, apron=TRUE, visible=TRUE,
           main="")
perspPoints(bei, Z=bei.extra$elev, M=M, pch=".", cex=1.25)
dev.off()
