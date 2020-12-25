
###
### Tables Chapter 2 -----------------------------------------------------------

## eff
kab_eff <- tibble(
  area = c(
    "Single, homogeneous stand",
    "15-ha plot",
    "1000-ha forest",
    "Natural area",
    "Species area"
  ),
  n = c("30", "100", "400", "800", "2000 to 3000")
)

## c03
kab_c03 <- tibble(
  a     = c( 100  ,  200  ,  400  , 1000  , 2500  , 5000  , 10000  ),
  n     = c(5000  , 2500  , 1250  ,  500  , 2900  ,  100  ,    50  ),
  delta = c(  17.4,   18.7,   20.0,   21.4,   20.1,   22.4,    23.5),
  cv    = c( 114.5,   87.0,   65.7,   44.4,   26.2,   20.5,    14.9)
)

###
### Tables chapter 4 -----------------------------------------------------------

## one
kab_one <- tibble(
  forest    = c(       1,                 1,           1,           1,           2, "$\\vdots$"),
  area      = c(     400, "40$\\textit{1}$",         400,         400,         650, "$\\vdots$"),
  plot      = c(     1.1,               1.1,         1.1,         1.2, "$\\vdots$", "$\\vdots$"),
  longitude = c(   7.345,             7.345,       7.345,       7.832, "$\\vdots$", "$\\vdots$"),
  latitude  = c(  12.146,            12.146,      12.146,      12.253, "$\\vdots$", "$\\vdots$"),
  tree      = c(  "1.1.1",          "1.1.1",     "1.1.2", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  species   = c(    "ANO",            "ANO",       "GUI", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  x         = c(      3.2,              3.2,         7.2, "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  y         = c(      4.5,              4.5,         2.1, "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  stem      = c("1.1.1.1",        "1.1.1.2", "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"), 
  D         = c(       20,               12, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  H         = c(       18,               15, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$"),
  V         = c(      2.3,              1.9, "$\\vdots$", "$\\vdots$", "$\\vdots$", "$\\vdots$")
)

## datasp
kab_datasp <- tibble(
  guild = c(rep("non-pioneer light demanding", 5), rep("pioneer", 4), rep("shade bearer", 7)),
  species = c(
    "Heritiera utilis", "Tieghemella heckelii", "Piptadeniastrum africanum", "Aubrevillea kerstingii", 
    "Afzelia bella", "Cecropia peltata", "Ceiba pentandra", "Nauclea diderrichii", "Daniellia thurifera",
    "Guarea cedrata", "Strombosia glaucescens", "Garcinia epunctata", "Drypetes chevalieri", "Cola nitida",
    "Nesogordonia papaverifera", "Dialium aubrevilliei"
  ),
  vernacular = c(
    "Nyankom", "Makore", "Dahoma", "Dahomanua", "Papao-nua", "Odwuma", "Onyina", "Kusia",
    "Sopi", "Kwabohoro", "Afena", "Nsokonua", "Katreka", "Bese", "Danta", "Dua bankye"
  )
)


###
### Tables chapter 5 -----------------------------------------------------------

## prim
kab_prim <- tibble(
  Name = c(
    "linear", "parabolic or quadratic", "$p$-order polynomial",
    "exponential or Malthus", "modified exponential", "logarithm", 
    "reciprocal log", "Vapor pressure"
  ),
  Equation = c(
    "$Y=a+bX$", "$Y=a+bX+cX^2$", "$Y=a_0+a_1X+a_2X^2+\\ldots+a_pX^p$",
    "$Y=a\\exp(bX)$", "$Y=a\\exp(b/X)$", "$Y=a+b\\ln X$", 
    "$Y=1/(a+b\\ln X)$", "$Y=\\exp(a+b/X+c\\ln X)$"
  ),
  Transformation = c(
    "same", "", "",
    "$Y'=\\ln Y$, $X'=X$", "$Y'=\\ln Y$, $X'=1/X$",
    "$Y'=Y$, $X'=\\ln X$","$Y'=1/Y$, $X'=\\ln X$", ""
  )
)


\hline\multicolumn{3}{|l|}{\it Exponential models}\\ %
exponential or Malthus & $Y=a\exp(bX)$ & $Y'=\ln Y$, $X'=X$\\ %
modified exponential & $Y=a\exp(b/X)$ & $Y'=\ln Y$, $X'=1/X$\\ %
logarithm & $Y=a+b\ln X$ & $Y'=Y$, $X'=\ln X$\\ %
reciprocal log & $Y=1/(a+b\ln X)$ & $Y'=1/Y$, $X'=\ln X$\\ %
Vapor pressure & $Y=\exp(a+b/X+c\ln X)$ & \\ %

\hline\multicolumn{3}{|l|}{\it Power law models}\\ %
power & $Y=aX^b$ & $Y'=\ln Y$, $X'=\ln X$\\ %
modified power & $Y=ab^X$ & $Y'=\ln Y$, $X'=X$\\ %
shifted power & $Y=a(X-b)^c$ & \\ %
geometric & $Y=aX^{bX}$ & $Y'=\ln Y$, $X'=X\ln X$\\ %
modified geometric & $Y=aX^{b/X}$ & $Y'=\ln Y$, $X'=(\ln X)/X$\\ %
root & $Y=ab^{1/X}$ & $Y'=\ln Y$, $X'=1/X$\\ %
Hoerl's model & $Y=ab^XX^c$ & \\ %
modified Hoerl's model & $Y=ab^{1/X}X^c$ & \\ %

\hline\multicolumn{3}{|l|}{\it Production-density models}\\ %
inverse & $Y=1/(a+bX)$ & $Y'=1/Y$, $X'=X$\\ %
quadratic inverse & $Y=1/(a+bX+cX^2)$ & \\ %
Bleasdale's model & $Y=(a+bX)^{-1/c}$ & \\ %
Harris's model & $Y=1/(a+bX^c)$ & \\ %

\hline\multicolumn{3}{|l|}{\it Growth models}\\ %
saturated growth & $Y=aX/(b+X)$ & $Y'=X/Y$, $X'=X$\\ %
mononuclear or Mitscherlich's model & $Y=a[b-\exp(-cX)]$ & \\ %

\hline\multicolumn{3}{|l|}{\it Sigmoidal models}\\ %
Gompertz & $Y=a\exp[-b\exp(-cX)]$ & \\ %
Sloboda & $Y=a\exp[-b\exp(-cX^d)]$ & \\ %
logistic or Verhulst & $Y=a/[1+b\exp(-cX)]$ & \\ %
Nelder & $Y=a/[1+b\exp(-cX)]^{1/d}$ & \\ %
von Bertalanffy & $Y=a[1-b\exp(-cX)]^3$ & \\ %
Chapman-Richards & $Y=a[1-b\exp(-cX)]^d$ & \\ %
Hossfeld & $Y=a/[1+b(1+cX)^{-1/d}]$ & \\ %
Levakovic & $Y=a/[1+b(1+cX)^{-1/d}]^{1/e}$ & \\ %
multiple multiplicative factor & $Y=(ab+cX^d)/(b+X^d)$ & \\ %
Johnson-Schumacher & $Y=a\exp[-1/(b+cX)]$ & \\ %
Lundqvist-Mat�rn ou de Korf & $Y=a\exp[-(b+cX)^d]$ & \\ %
Weibull & $Y=a-b\exp(-cX^d)$ & \\ %

\hline\multicolumn{3}{|l|}{\it Miscellaneous models}\\ %
hyperbolic & $Y=a+b/X$ & $Y'=Y$, $X'=1/X$\\ %
sinusoidal & $Y=a+b\cos(cX+d)$ & \\ %
heat capacity & $Y=a+bX+c/X^2$ & \\ %
Gaussian & $Y=a\exp[-(X-b)^2/(2c^2)]$ & \\ %
rational fraction & $Y=(a+bX)/(1+cX+dX^2)$ & \\\hline%
\end{tabula