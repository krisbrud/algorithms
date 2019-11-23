include("sort-test.jl")

function merge!(A, p, q, r)
    # Merge the sorted subarrrays A[p..q] and A[q+1..r]
    # into one sorted subarray A[p..r]

    n1 = q - p + 1 # Length of subarray A[p..q]
    n2 = r - q # Length of subarray A[q+1..r]

    # Copy the lists to be able to use the text-book solution in Cormen
    L = []
    R = []
    # Copy left subarray
    for i = 1:n1
        push!(L, A[p + i - 1]) 
    end
    # Copy right subarray
    for j = 1:n2
        push!(R, A[q + j])
    end
    # Add infinite values at the end of the copied arrays. 
    # Not really needed, but makes the rest of the implementation easier,
    # as we do not need to do index-checking
    inf = typemax(typeof(A[1]))
    push!(L, inf)
    push!(R, inf)

    # Actually merge the arrays
    i = 1
    j = 1

    for k = p:r
        if L[i] <= R[j]
            A[k] = L[i]
            i = i + 1
        else
            A[k] = R[j]
            j = j + 1
        end
    end
end

function mergesort!(A, p = 1, r = length(A))
    # Inplace sort the subarray A[p..r] using the Merge-Sort algorithm
    if p < r
        # Pick the floor of the average index as the split
        q = div(p + r, 2) 
        mergesort!(A, p, q) # Sort the left subarray
        mergesort!(A, q + 1, r) # Sort the right subarray
        merge!(A, p, q, r) # Merge the sorted subarrays
    end
    
    return A
end

sort_test(mergesort!)