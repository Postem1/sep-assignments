
# require 'benchmark'

# Heapsort is an O(n \log n)O(nlogn) sorting algorithm that works by first constructing a heap out of the list and repeatedly pulling the root off the top of the heap and reconstructs it until there are no items left in the heap. The values that are pulled off of the top of the heap come out in sorted order.
# If the heap used was a min-heap, the resulting list will be in ascending order, and a max-heap will give them in descending order.


# In an array implementation of a max heap, starting at index 1 as the root
# dividing an index by 2 gives you its parent index,
# the left child is found by multiplying the current index by 2,
# the right child is found by multiplying the current index by 2 + 1
#
# def heapSort(array)
#
#   # Build our max heap...with max of arr.length
#   build_max_heap(array)
#
#   # Find last element.
#   last_element_index = array.length - 1
#
#   # Continue heap sorting until array is sorted
#   while(last_element_index > 0)
#     swap(array, 0, last_element_index) # Value at the 0th position is the root
#
#     heapify(array, 0, last_element_index)
#
#     last_element_index -= 1
#   end
#
#   return array
# end
#
#
# def build_max_heap(array)
#   i = (array.length / 2 - 1).floor
#
#   # Build a max heap out of all array elements passed in.
#   while (i >= 0)
#     heapify(array, i, array.length)
#     i -= 1
#   end
# end
#
# # heapify() moves one element at a time down to its correct location in the heap.
# def heapify(heap, i, max)
#
#   while (i < max)
#     index = i
#
#     left_child = 2 * i + 1
#     right_child = left_child + 1
#
#     if ( (left_child < max) && (heap[left_child] > heap[index]) )
#       index = left_child
#     end
#
#     if ( (right_child < max) && (heap[right_child] > heap[index]) )
#       index = right_child
#     end
#
#     if (index == i)
#       return
#     end
#
#     swap(heap, i, index)
#
#     i = index
#   end
# end
#
# def swap(array, first_item_index, last_item_index)
#   tmp = array[first_item_index]
#
#   # Swap first and last items in the array.
#   array[first_item_index] = array[last_item_index]
#   array[last_item_index] = tmp
# end

#

def heap_sort(array)

  #build the max heap
  n = array.length - 1
  a = array

  (n / 2).downto(0) do |i|   
    create_max_heap(a, i, n)
  end

  # while the array length is greater than 0, swap root element with the last element,
  # reduce the length by 1 (since we have sorted one item), and re-build the heap so that it satisfies the max-heap condition.
  while n > 0
    a[0], a[n] = a[n], a[0]  #  a[n] is the last element
    n -= 1
    create_max_heap(a, 0, n)
  end

  return a
end


# The create_max_heap method will sift the elements until they’re in their rightful place.
# "parent" indicates where to start sifting
# "limit" tells how far down the heap to sift.
def create_max_heap(array, parent, limit)

  # Set parent node as the root
  root = array[parent]

  # While the child index is less than or equal to the limit
  # which indicates that root has at least one child
  while (child = 2 * parent) <= limit

    # we increment child by 1 to get it’s sibling
    # IF the child is less than limit and the value of child is smaller than value of it’s sibling
    if (child < limit) && ( array[child] < array[child + 1])
      child += 1
    end

    # The loop terminates if value of root is greater than value of child (since root must always be greater than children in a max heap)
    if root >= array[child]
      break
    end

    # Otherwise, swap the value of parent and child, and after the loop, we set the array[parent] equal to the stored root value.
    array[parent], parent = array[child], child
    array[parent] = root
  end

  array
end

# arr = Array.new(50){rand(0...50)}
# p heap_sort(arr)
#

# puts "====================10,000 items================================"
#
# arr1 = Array.new(10000){rand(0...10000)}
# arr2 = Array.new(arr1)
#
# Benchmark.bmbm(50) do |x|
#   x.report("heap_sort    ")     {heap_sort(arr1)}
#   x.report("heapSort     ")     {heapSort(arr2)}
# end
