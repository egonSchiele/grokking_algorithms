binary_search <- function(list, item) {
        # low and high keep track of which part of the list you'll search in.
        # Every data structure in R indexed by starting at 1.
        low <- 1
        high <- length(list)
        
        # While you haven't narrowed it down to one element ...
        while (low <= high) {
                # ... check the middle element
                mid <- (low + high) %/% 2
                guess <- list[mid]
                # Found the item.
                if (guess == item) {
                        return(mid)
                }
                # The guess was too high.
                else if (guess > item) {
                        high <- mid - 1
                } 
                else{ # The guess was too low.
                        low <- mid + 1
                }
        }
        # Item doesn't exist
        return(NULL)
}


# Set a list
my_list <- list(1, 3, 5, 7, 9)

# Call the function
binary_search(my_list, 3) # => 1
binary_search(my_list, -1) # => NULL

# All above code can be simplified by using "which" function
which(my_list == 3) # => 1
