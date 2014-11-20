#'  Even was not requested, I added a small verification to
#'check if matrix has an inverse. If determinant of the matrix
#'is 'zero' (or almost zero) the matrix does not have an inverse
#'and should exit with a message

makeCacheMatrix <- function(x = matrix()) {
  #inverse matrix variable
  inverseMatrix <- NULL
  
  #check if determinant is not zero (or very close)
  det <- abs(det(x))
  
  #if zero (or almost), inverse does not exists, so exit function
  if (det < 0.000001){
    message("Matrix does not have a Inverse")
    return(x)
  }
  
  #return the 'm' matrix
  get <- function() x
  
  #set the 'inv' value to the 'inverseMatrix' variable
  setinv <- function(inv) inverseMatrix <<- inv
  
  #get the 'inverseMatrix' value
  getinv <- function() inverseMatrix
  
  #list needed functions
  list(get = get, 
       setinv = setinv,
       getinv = getinv)
}


#'  Function tries first to get the inverse from the cache, if it is available
#'it ends the function returning the inversed matrix and gives a message 
#'indicating result was from cache.
#'If cache is not available

cacheSolve <- function(x, ...) {
  #trying to get the inversed matrix from cache
  inverseMatrix <- x$getinv()
  
  #if inversed matrix comes from cache, send a message and
  # exits function returning cache value
  if (!is.null(inverseMatrix)){
    message("Getting Cached Data")
    return(inverseMatrix)
  }
  
  #if not in cache, continues...  
  
  #getting matrix
  data <- x$get()
  
  #calculating inverse
  inverseMatrix <- solve(data)
  
  #adding to cache
  x$setinv(inverseMatrix)
  
  #returning value
  inverseMatrix
}
