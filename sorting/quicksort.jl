include("sort-test.jl")

function partition!(A, p, r)
    x = A[r] # Pivot
    i = p - 1 # Current largest index where all elements A[p..i] <= x
    for j = p:r-1
        if A[j] <= x
            i = i + 1
            # Swap A[i] and A[j]
            A[i], A[j] = A[j], A[i]
        end
    end
    # We now have that A[p..i] <= x, and x <= A[i..r-1], but the pivot is not
    # in it's right place at i + 1 yet

    # Swap A[i + 1] with A[r]
    A[i + 1], A[r] = A[r], A[i + 1]

    # Return the index of the pivot x
    return i + 1
end

function quicksort!(A, p = 1, r = length(A))
    # In-place sorts the subarray A[p..r] using the Quick-Sort algorithm
    if p < r # Need at least two elements
        q = partition!(A, p, r) 
        # q is now an index s.t. A[1..q-1] =< A[q] and A[q] <= A[q+1..r]
        quicksort!(A, p, q - 1) # Recurisvely sort the subarray A[p..q-1]
        quicksort!(A, q + 1, r) # Recursively sort the subarray A[q..r]
    end

    return A
end

sort_test(quicksort!)