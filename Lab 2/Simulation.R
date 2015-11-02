#Monte Carlo Inference
#Lab 2 - Simulation

packages <- c("ggplot2", "ggthemes", "dplyr", "RColorBrewer")
lapply(packages, library, character.only = TRUE)
cols <- brewer.pal(4, "Set2")

# Inverted exponential distribution
inv.exp <- function(n, lambda){
  
  u <- runif(n)
  x <- -log(1-u)/lambda
  return(x)
}

# Sampling from the Gamma distn
# In this case k must be an integer to simplifiy
# the distn down to the sum of exponential distns

inv.gamma.int <- function(n, k, lambda) {
  
  x <- matrix(inv.exp(n*k, lambda), ncol= k)
  apply(x, 1, sum)
  
}

y <- inv.gamma.int(2000, 4, 0.5)
df <- data.frame(y)

ggplot(df, aes(x = y)) + 
  geom_histogram(aes(y =..density..), fill = cols[1]) + 
  stat_function(fun = dgamma, size = 1, args = list(rate = 0.5, shape = 4), color = cols[2]) +
  xlab("Sample Value") + ylab("Density") +
  theme_fivethirtyeight()

ks.test(y, "pgamma", rate = 0.5, shape = 4)

# Rejection Sampling of gamma distn

rejectionSampling <- function(n, k, l, m){
  
  x <- inv.gamma.int(n, floor(k), l-1)
  y <- runif(n, 0, 1)
  
  acc <- ifelse((x*y) <= m*dgamma(x, shape = k, rate = l), TRUE, FALSE)
  
  res <- data.frame(Samples = (x), Accepted = acc)
  return(res)
}
  
res <- rejectionSampling(5000, 4.5, 3, 1.95)

#Plot of all samples, including rejected ones
ggplot(res, aes(x = Samples)) + 
  geom_histogram(aes(y =..density..), fill = cols[1]) + 
  stat_function(fun = dgamma, size = 1, args = list(shape = 4.5, rate = 3), color = cols[2]) +
  stat_function(fun = dgamma, size = 1, args = list(shape = 4, rate = 2)) +
  xlab("Sample Value") + ylab("Density") +
  theme_fivethirtyeight()

#Filter sample for accecpted only
res <- filter(res, Accepted == TRUE)

#Plot accepted samples only
ggplot(res, aes(x = Samples)) + 
  geom_histogram(aes(y =..density..), fill = cols[1]) + 
  stat_function(fun = dgamma, size = 1, args = list(shape = 4.5, rate = 3), color = cols[2]) +
  stat_function(fun = dgamma, size = 1, args = list(shape = 4, rate = 2)) +
  xlab("Sample Value") + ylab("Density") +
  theme_fivethirtyeight()

ks.test(res$x, "pgamma", rate = 3, shape = 4.5)