## This function is going to attempt caching the inverse of a matrix
##

## This function makes the cache matrix
## 1. Set the value of the matrix
## 2. Get the value of the matrix
## 3. Set the value of the inverse
## 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
      x <<- y
      i <<- NULL
      
  }
  get <- function() x
  setinv <- function(inverse) i <<- inverse
  getinv <-function() i
  
list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function calculates the inverse of the matrix created above
## It will try to get the inverse from the cache if it exists.

cacheSolve <- function(x, ...) {
## This part goes after the cached data 
i <- x$getinv()
if(!is.null(i)) {
  message("getting cached data")
  return(i)
}
data <- x$get()
  i = solve(data, ...)
  x$setinv(i)
  return(i)


}