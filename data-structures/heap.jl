# Implements a max-heap data structure, where the children of each node is
# smaller or equal to it's parent

# Uses the Heap struct defined here, as we need the heapsize-property for the
# Heapsort algorithm later

mutable struct Heap
    arr::Array
    heapsize::Int
end

Heap() = Heap([], 0)

# Indexing functions, same for every heap
function parent(i)
    return div(i, 2) # Floored
end

function left(i)
    return 2 * i
end

function right(i)
    return 2 * i + 1
end

function maxheapify!(heap, i)
    # Assumes that the subheaps at heap[left(i)] and heap[right(i)] are valid, but the
    # subheap at heap[i] might not be. Ensures the heap property is maintained 
    # after the function is called

    l = left(i)
    r = right(i)

    # Find the largest of i, and it's children
    
    # Check if the left child is larger than the parent
    if l <= heap.heapsize && heap.arr[l] > heap.arr[i]
        # The left element is sm
        largest = l
    else 
        largest = i
    end

    if r <= heap.heapsize && heap.arr[r] > heap.arr[largest]
        # The right child is the largest one
        largest = r
    end

    if largest != i # Heap property not 
        # Swap heap.arr[i] with heap.arr[largest]
        heap.arr[i], heap.arr[largest] = heap.arr[largest], heap.arr[i]
        maxheapify!(heap, largest)
    end
end

function buildmaxheap(A)
    # Makes a heap with the elements of the array A
    heap = Heap()

    heap.arr = copy(A)
    heap.heapsize = length(heap.arr)

    for i = div(length(heap.arr), 2):-1:1
        maxheapify!(heap, i)
    end

    return heap
end

# Non-automated test:
# A = [4, 5, 6, 3, 2, 1, 5, 3]
# heap = buildmaxheap(A)
# println("A: $A, heap: $heap")
