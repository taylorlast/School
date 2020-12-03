###
###the input xx here is a vector (x1, ... x8)
###please do not look at what is inside of this function inf_slope. Just treat it as a blackbox function.
### a borehole simulation: we set all flow rate above be 1, otherwise 0.
borehole <- function(xx)
{
  #https://www.sfu.ca/~ssurjano/borehole.html#:~:text=The%20Borehole%20function%20models%20water,%2C%20in%20m3%2Fyr.
  # OUTPUT AND INPUT:
  # y  = water flow rate
  # xx = c(rw, r, Tu, Hu, Tl, Hl, L, Kw)
  # xx is 0-1 design
  ##########################################################################
  rw <- xx[1]*(0.15-0.05) + 0.05
  r  <- xx[2]*(50000-100) + 100
  Tu <- xx[3]*(115600-63070) + 63070
  Hu <- xx[4]*(1110-990) + 990
  Tl <- xx[5]*(116-63.1) + 63.1
  Hl <- xx[6]*(820-700) + 700
  L  <- xx[7]*(1680-1120) + 1120
  Kw <- xx[8]*(12045-9855) + 9855
  
  frac1 <- 2 * pi * Tu * (Hu-Hl)
  
  frac2a <- 2*L*Tu / (log(r/rw)*rw^2*Kw)
  frac2b <- Tu / Tl
  frac2 <- log(r/rw) * (1+frac2a+frac2b)
  
  y <- frac1 / frac2
  return(y)
}

###see some examples
# library(LHD)
# eg_x = (rLHD(n=10,k=8)-0.5)/10
# eg_y = apply(eg_x, 1, borehole)
# eg_data = cbind(eg_x, eg_y)
# colnames(eg_data) = c("x1", "x2", "x3","x4","x5","x6","x7","x8","y")
# eg_data
