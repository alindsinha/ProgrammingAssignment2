## The two functions are used to demonstrate lexical scoping in R
## 

## The fits function takes in a matrix as a input and returns 
## a list of functions where in the functions are used to set and get the 
## value by the use of "<<-" operator which edits the values in the parent function

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This function takes a list of functions as an input with the other 
## default values and tries to re calculate the inverse of the matrix-if it
## is unable to retrieve it from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		 m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
