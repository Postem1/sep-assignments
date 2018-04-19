# require 'benchmark'

# quick sort is a divide and conquer algorithm.
# Quick sort has three steps. First, it picks a pivot point.
# Our strategy will be to use the last item in the collection.

# Quick sort then iterates over the collection and compares each item to the pivot point, if the item is greater than the pivot point then it is moved to the right of the pivot point and the item at the pivot points shifts one index to the left.

# After all items that are greater than pivot point have been moved, quick sort recursively applies the previous step to the left and right sides of the collection.
# The left and right sides are defined as the sides to the left and right of the pivot point.



# class Array
#   def quicksort
#     return [] if empty?
#
#     # pull out the element at random index number. Value is stored in a variable
#     pivot =  delete_at(rand(size)) #refers to the current array since we are in the Array class
#
#     # partition returns two arrays, the first containing the elements for which the block evaluates to true, the second containing the rest.
#     left, right = partition(&pivot.method(:>))
#     #
#     return *left.quicksort, pivot, *right.quicksort
#   end
# end


def quick_sort(array)

  # base case
  if array.length <= 1
    return array
  end

  pivot = array.delete_at(array.length - 1) # remove the pivot
  left = []
  right = []

  #Loop through the array, comparing items to pivot and collecting them into left and right arrays
  # array.each do |x|
  #   if x <= pivot
  #     left << x
  #   else
  #     right << x
  #   end
  # end

  left, right = array.partition {|num| num < pivot}

  # recursively call "quicksort" on your left and right arrays.
  sorted_array = []
  sorted_array << quick_sort(left)
  sorted_array << pivot
  sorted_array << quick_sort(right)

  # using Array.flatten to remove sub-arrays
  sorted_array.flatten!
end

# arr = Array.new(50){rand(0...50)}
# p quicksort(arr)
#
# puts "====================100,000 items================================"
#
# arr1 = Array.new(100000){rand(0...100000)}
# arr2 = Array.new(arr1)
#
# Benchmark.bm(50) do |x|
#   x.report("quick_sort    ")     {quick_sort(arr1)}
#   x.report("quicksort     ")     {arr2.quicksort}
# end
