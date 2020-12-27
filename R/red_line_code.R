
## Chapter 4 ------

## RL 01
dat <- read_csv("source/data/henry_et_al2010.csv", col_types = cols())

summary(dat)

max(abs(dat$Btot-rowSums(dat[,c("Bbran","Bfol","Btronc","Bctf")])))

##--- Equivalent tidyverse

dat2 <- dat %>%
  mutate(
    Btot_calc = Bbran + Bfol + Btronc + Bctf,
    flag_Btot = Btot - Btot_calc
    )

dat2 %>% pull(flag_Btot) %>% max()


## RL 02
plot(dat$dbh, dat$Btot, xlab = "dbh (cm)", ylab = "Biomass (t)")


## RL03 
with(dat,plot(dbh^2*heig,Btot,xlab="D2H (cm2.m)",ylab="Biomass (t)"))

##RL04
n <- 4
d <- quantile(dat$dens,(0:n)/n)
i <- findInterval(dat$dens,d,rightmost.closed=TRUE)

with(dat,plot(dbh^2*heig, Btot, xlab="D2H (cm2m)", ylab="Biomass (t)", log="xy",
              pch=i, col=i))
