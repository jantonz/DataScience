## Put comments here that give an overall description of what your
## functions do

#The first function takes a square (make sure it's square!) matrix and caches its inverse.
#The second one solves the square matrix only if there's no solution already cached.

## Write a short comment describing this function
#The first function takes a square (make sure it's square!) matrix and caches its inverse.
#It "hides" it in the "inv". The output of makeCacheMatrix is a named list of functions.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)    
}


## Write a short comment describing this function
#The cacheSolve checks if the solution is already in the cache; if so, we return
#a message "getting cached data" and the value of "inv" ("inv" it's the inverse of 
#our original matrix). If the solution is not in the cache, then we get the matrix
#with x$get(), we solve it and print it.


cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    print(inv)
}
