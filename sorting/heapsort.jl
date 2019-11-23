include("../data-structures/heap.jl")
include("sort-test.jl")

function heapsort!(A)
    heap = buildmaxheap(A) # Make a max-heap from the array

    for i = length(heap.arr):-1:2
        heap.arr[i], heap.arr[1] = heap.arr[1], heap.arr[i]
        heap.heapsize = heap.heapsize - 1 
        # heap.arr[heapsize..length(heap.arr)] is now a sorted subarray
        maxheapify!(heap, 1)
    end

    return heap.arr
end

sort_test(heapsort!)