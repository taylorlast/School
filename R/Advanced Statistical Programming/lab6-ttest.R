######################
# Taylor Last
# Lab 6 5365

# Writing own t test
#######################


my.ttest <- function(x,y=NULL,alternative = 'two.sided', mu = 0){
  if (missing(y)){
    onesample = TRUE
  }
  else {
    onesample = FALSE
  }
  
  if(onesample){
    if (alternative == 'greater'){
      t_stat = ((mean(x)- mu) / sd(x)/sqrt(length(x)))
      p_value = pt(t_stat,df=length(x)-1,lower.tail = FALSE)
    }
    else if (alternative == 'less'){
      t_stat = ((mean(x)- mu) / sd(x)/sqrt(length(x)))
      p_value = pt(-t_stat,df=length(x)-1,lower.tail = FALSE)
    }
    else{
      t_stat = ((mean(x)- mu) / sd(x)/sqrt(length(x)))
      p_value = pt(t_stat,df=length(x)-1,lower.tail = TRUE)
    }
  }
  else {
    if (alternative == 'greater'){
      t_stat = ((mean(x) - mean(y)) / sqrt((sd(x))^2/length(x) + (sd(y))^2/length(y)))
      p_value = pt(t_stat,(df=length(x)+length(y)-2),lower.tail = FALSE)
    }
    else if (alternative == 'less'){
      t_stat = ((mean(x)- mean(y)) / sqrt((sd(x))^2/length(x) + (sd(y))^2/length(y)))
      p_value = pt(-t_stat,(df=length(x)+length(y)-2),lower.tail = FALSE)
    }
    else{
      t_stat = ((mean(x)- mean(y)) / sqrt((sd(x))^2/length(x) + (sd(y))^2/length(y)))
      p_value = pt(t_stat,(df=length(x)+length(y)-2),lower.tail = TRUE)
    }
  }
  result = c(t_stat,p_value)
  return(result)
}

my.ttest(1:10,y=c(7:20))

