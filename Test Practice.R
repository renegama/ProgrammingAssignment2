#Example 1
#Matrix that does have inverse
mm <- matrix(c(1, 1, 4, 0, 3, 1, 4, 4, 0), ncol=3)

#matrix
mm

#checking it has determinant
abs(det(mm))

#makeing
temp <- makeCacheMatrix(mm)

#calculating first time
cacheSolve(temp)

#second from cache
cacheSolve(temp)

#Example 2
#Matrix that does not have inverse
mm <- matrix(c(3, 5, 1, 6, 2, 2, 3, 1, 1), ncol=3)

#matrix
mm

#checking it has determinant
abs(det(mm))

#makeing
temp <- makeCacheMatrix(mm)

#calculating (error because no inverse)
cacheSolve(temp)
