## [Put comments here that describe what your functions do]
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## I used of Mass package for calculate inverse of matrix
library(Mass)
makeCacheMatrix <- function(x = matrix) {
  #I set the initial value of the inverse to null:
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  # get the matrix:
  get <- function() x
  setsolve <- function(solve) inverse <<- solve
  getsolve <- function() inverse
  list(set = set, 
       get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

#wanna get the cache data, so write the following function:
cacheSolve <- function(x, ...) {
  inverse <- x$getsolve()
  
  if(!is.null(inverse)) {
    message("getting inverse of the matrix...")
    #return inverse of matrix
    return(inverse)
    
  }
  
  ##calculate inverse of matrix:
  data <- x$get()
  inverse <- solve(data, ...)
  x$setsolve(inverse)
  inverse
}
