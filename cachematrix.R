#'  Even was not requested, I added a small verification to
#'check if matrix has an inverse. If determinant of the matrix
#'is 'zero' (or almost zero) the matrix does not have an inverse
#'and should exit with a message

makeCacheMatrix <- function(x = matrix()) {
  determinant <- NULL
  inverseMatrix <- NULL
  
  #check if determinant is not zero
  det <- abs(det(x))
  
  if (det < 0.000001){
    message("Matrix does not have a Inverse")
    return(x)
  }
  
  set <- function(y){
    x <<- y
    inverseMatrix <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(inv) inverseMatrix <<- inv
  getinv <- function() inverseMatrix
  
  list(set = set, 
       get = get, 
       setinv = setinv,
       getinv = getinv)
}


#'  Function tries first to get the inverse from the cache, if it is available
#'it ends the function returning the inversed matrix and gives a message 
#'indicating result was from cache.
#'If cache is not available

cacheSolve <- function(x, ...) {
  inverseMatrix <- x$getinv()
  
  if (!is.null(inverseMatrix)){
    message("Getting Cached Data")
    return(inverseMatrix)
  }
  
  #getting matrix
  data <- x$get()
  
  #calculating inverse
  inverseMatrix <- solve(data)
  
  #adding to cache
  x$setinv(inverseMatrix)
  
  #returning value
  inverseMatrix
}
