MersenneTwister <- function(n,p=1,graine)
{
  set.seed(graine,kind='Mersenne-Twister')
  x <- sample.int(2^32-1,n*p)
  x <- matrix(x,nrow=n,ncol=p)
  return(list(x=x,s=x[n]))
}


Sobol <- function(n,p) 
{
  return(round(sobol(n,p)*(2^31-1)))
}


RANDU <- function(graine)
{
  a <- 65539
  b <- 0
  m <- 2^31
  S <- (a*graine+b)%%m
  return (S)
}


StandardMinimal <- function(graine)
{
  a <- 16807
  b <- 0
  m <- 2^31 - 1
  S <- (a*graine+b)%%m
  return (S)
}


generateur_RANDU <- function(graine, n)
{
  randoms <- rep(0, n)
  random <- RANDU(graine)
  i <- 1
  for(i in 1:n)
  {
    randoms[i] <- random
    random <- RANDU(random)
    i <- i + 1
  }
  return (randoms)
}


generateur_StandardMinimal <- function(graine, n)
{
  randoms <- rep(0, n)
  random <- StandardMinimal(graine)
  i <- 1
  for(i in 1:n)
  {
    randoms[i] <- random
    random <- StandardMinimal(random)
    i <- i + 1
  }
  return (randoms)
}

binary <- function(x)
{
  if((x<2^31)&(x>0))
    return( as.integer(rev(intToBits(as.integer(x)))) )
  else{
    if((x<2^32)&(x>0))
      return( c(1,binary(x-2^31)[2:32]) )
    else{
      cat('Erreur dans binary : le nombre etudie n est pas un entier positif en 32 bits.\n')
      return(c())
    }
  }
}


