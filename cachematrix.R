# I created two functions in R that work with matrices: one to create a special matrix object that can cache its inverse, and another to compute the inverse of the matrix, utilizing caching to avoid recomputation when possible.

makeCacheMatrix <- function(mat = matrix()) {
  
  cache <- NULL
  
  set <- function(matrix) {
    mat <<- matrix  
    cache <<- NULL  
  }
  
  
  get <- function() {
    mat  
  }
  
  
  setInverse <- function(inverse) {
    cache <<- inverse  
  }
  
  
  getInverse <- function() {
    cache  
  }
  
  
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


cacheSolve <- function(cachedMatrix, ...) {
  
  cachedInverse <- cachedMatrix$getInverse()
  if (!is.null(cachedInverse)) {
    message("getting cached inverse")
    return(cachedInverse)  
  }
  
  
  mat <- cachedMatrix$get()
  inverse <- solve(mat, ...)  
  
  
  cachedMatrix$setInverse(inverse)
  
  
  inverse
}

