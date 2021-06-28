## These functions stores the code needed to solve the inverse matrix to the cache
## then cache solve returns the inverse of the matrix to the cache


## This function takes a matrix and saves it to the cache. It returns a list with 4
## items containing the code from the funciton.
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This function returns the inverse of the matrix, either saved in the cache
## or from a character argument
cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
matri <- matrix(c(-0.4,0.6,0.6,-0.4), nrow = 2, ncol = 2)
mc <- makeCacheMatrix(matri)
cacheSolve(mc)