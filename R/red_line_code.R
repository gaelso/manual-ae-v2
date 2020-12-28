
## Chapter 4 ------

## RL01
dat <- read_csv("source/data/henry_et_al2010.csv", col_types = cols())

summary(dat)

max(abs(dat$Btot-rowSums(dat[,c("Bbran","Bfol","Btronc","Bctf")])))

## Chapter 5 ------

## RL02
plot(dat$dbh, dat$Btot, xlab = "dbh (cm)", ylab = "Biomass (t)")


## RL03 
with(dat,plot(dbh^2*heig,Btot,xlab="D2H (cm2.m)",ylab="Biomass (t)"))

## RL04
n <- 4
d <- quantile(dat$dens,(0:n)/n)
i <- findInterval(dat$dens,d,rightmost.closed=TRUE)

with(dat,plot(dbh^2*heig, Btot, xlab="D2H (cm2m)", ylab="Biomass (t)", log="xy",
              pch=i, col=i))

m <- as.data.frame(lapply(split(dat,i), function(x) 
  coef(lm(log(Btot) ~ I(log(dbh^2*heig)),data=x[x$Btot>0,]))))

dmid <- (d[-1]+d[-n])/2
plot(dmid,m[1,],xlab="Wood density (g/cm3)",ylab="y-Intercept")
plot(dmid,m[2,],xlab="Wood density (g/cm3)",ylab="Slope")

## RL05
plot(dat$dbh,dat$Btot,xlab="Diameter (cm)",ylab="Biomass (t)",log="xy")


## RL06
with(dat,plot(dbh^2*heig,Btot,log="xy",xlab="D2H (cm2.m)",ylab="Biomass (t)"))


## Chapter 06 ------

## RL07
m <- lm(log(Btot) ~ I(log(dbh)),data = dat[dat$Btot>0,])
summary(m)

plot(m,which=1:2)

## RL08
m <- lm(log(Btot) ~ I(log(dbh^2*heig)),data=dat[dat$Btot>0,])
summary(m)

plot(m,which=1:2)

## RL09
m2 <- lm(log(Btot) ~ I(log(dbh)) + I(log(dbh)^2), data=dat[dat$Btot>0,])
print(summary(m2))

m3 <- lm(log(Btot) ~ I(log(dbh))+I(log(dbh)^2)+I(log(dbh)^3),data=dat[dat$Btot>0,])
print(summary(m3))

m4 <- lm(log(Btot) ~ I(log(dbh))+I(log(dbh)^2)+I(log(dbh)^3)++I(log(dbh)^4),data=dat[dat$Btot>0,])
print(summary(m4))

with(dat,plot(dbh,Btot,xlab="Dbh (cm)",ylab="Biomass (t)",log="xy"))
D <- 10^seq(par("usr")[1],par("usr")[2],length=200)
D <- seq(0, max(dat$dbh), length=200)
lines(D,exp(predict(m,newdata=data.frame(dbh=D))))
lines(D,exp(predict(m2,newdata=data.frame(dbh=D))))
lines(D,exp(predict(m3,newdata=data.frame(dbh=D))))
lines(D,exp(predict(m4,newdata=data.frame(dbh=D))))

