library("ggplot2")
library("ggthemes")
library("animation")

conGen <- function(seed, n, m){
  
  arr <- rep(0, n)
  arr[1] <- seed
  for(i in 1:n){
    arr[i+1] <- (5*arr[i] + 7)%%m
  }
  
  unif <- arr/m
  return(data.frame(unif))
  
}

sim <- conGen(0, 10000, 256)

ani.options(convert ="C:\Program Files\ImageMagick-6.9.2-Q16\convert.exe")

saveGIF(
  
  for(i in 1:50){
  
    top <- i*20
    res <- data.frame(unif = sim[1:top,])
    
    p <- ggplot(data = res, aes(res$unif)) + 
      geom_histogram(binwidth = 1/50) + 
      ggtitle("Simulated Uniform Distribution") + 
      xlab("Number") + 
      ylab("Frequency") + 
      xlim(0,1) +
      ylim(0,55) +
      theme_tufte() +
      theme(plot.title = element_text(face="bold", vjust = 0.8))
    
    print(p)
},

movie.name = "Congruential_Number_Generator.gif", interval = 0.2, nmax = 50, outdir = getwd(), imgdir=getwd(), tempdir=getwd()


)

