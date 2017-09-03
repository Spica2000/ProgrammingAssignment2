## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# The function creates a special "matrix" object that can cache its inverse.
# First, it defines a function to set the matrix, x, to a new matrix, y, and resets the inversion (inv) to NULL
# returns the matrix, x
# sets the inversion (inv) to inversion
# returns the inversion (inv)
# returns the 'special matrix' containing all of the functions just defined

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(solveMatrix) inv <<- solveMatrix
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
# The next function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setInverse(inv)
    inv      
}
