# require 'benchmark'

# select an element and check to see if the other elements are smaller
# keep the index of the smallest element
# At the end of the iteration, swap current and smallest, if not the same
def selection_sort(collection)
  length = collection.length

  for i in 0..length - 2
    min_index = i                # assumption of smallest value

    for j in (i + 1)...length
      if collection[j] < collection[min_index] # look for values less than min_index
        min_index = j            # if an element is found to be less, its index is the new min_index
      end
    end

    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp

  end

  collection
end

# def selectionSort(arr)
#
#   0.upto(arr.length - 1) do |i|
#     indexOfMin = i # assumption of smallest value
#
#     (i + 1).upto(arr.length - 1) do |j|
#       if (arr[j] < arr[indexOfMin])  # look for values less than indexOfMin
#         indexOfMin = j # if an element is found to be less, its index is the new indexOfMin
#       end
#     end
#
#     if (indexOfMin != i)  # if indexOfMin and i don't match, swap them
#       lesser = arr[indexOfMin]
#       arr[indexOfMin] = arr[i]
#       arr[i] = lesser
#     end
#   end
#
#   return arr
# end

# arr = Array.new(50){rand(0...50)}
# p selectionSort(arr)

# puts "====================10,000 items================================"
#
# arr1 = Array.new(10000){rand(0...10000)}
# arr2 = Array.new(arr1)
#
# Benchmark.bmbm(50) do |x|
#   x.report("selection_sort    ")     {selection_sort(arr1)}
#   x.report("selectionSort     ")     {selectionSort(arr2)}
# end
