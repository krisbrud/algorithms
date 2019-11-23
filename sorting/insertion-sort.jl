include("sort-test.jl")

function insertionsort!(A)
    for j = 2:length(A)
        key = A[j]
        # Insert A[j] into the sorted sequence A[1.. (j - 1)]
        i = j - 1
        while i > 0 && A[i] > key 
            # Keep swapping places until we find an element that is
            # smaller than our key
            A[i + 1] = A[i]
            i = i - 1
        end
        # Insert our key
        A[i + 1] = key
    end

    return A
end

# Try if the sorting function works...
sort_test(insertionsort!)