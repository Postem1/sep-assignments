# require 'benchmark'

 # Bubble sort operates by comparing two adjacent items at a time in a collection.
 # In each iteration it swaps the items based on the sorting logic.
 # Bubble sort may loop through the collection multiple times before the sorting is complete.
 # For each pass through the collection, bubble sort guarantees at least one value is in its proper, sorted position

#
#
# def bubble_sort2(collection)
#   n = collection.length
#   begin
#     swapped = false
#
#     (n - 1).times do |i|
#       if collection[i] > collection[i + 1]
#         tmp = collection[i]
#         collection[i] = collection[i + 1]
#         collection[i + 1] = tmp
#         swapped = true
#       end
#     end
#   end until not swapped
#
#   collection
# end

def bubble_sort(array)
  arr = array
  i = 0
  while i < (arr.length)
    j = 0
    while j < (arr.length - i - 1)
      if arr[j] > arr[j + 1]
       arr[j], arr[j + 1] = arr[j + 1], arr[j]
      end
      j += 1
    end
    i += 1
  end

  arr
end

#
# arr = Array.new(50){rand(0...50)}
# p bubble_sort(arr)

# puts "====================10000 items================================"
#
# arr1 = Array.new(10000){rand(0...10000)}
# arr2 = Array.new(arr1)
#
# Benchmark.bm(20) do |x|
#   x.report("bubble_sort1")    {bubble_sort1(arr1)}
#   x.report("bubble_sort2")    {bubble_sort2(arr2)}
# end
