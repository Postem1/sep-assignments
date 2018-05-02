require './poorly_written_ruby'
require 'benchmark'


def time_optim(*arrays)
  combined_array = arrays.flatten
  mergeSort(combined_array)
end

# Worst possible runtime : n*log(n)
# Take an array and divide into smallest chunk size possible...1
# When size of array is 1, pass the 2 arrays (of size 1 at first) to merge function
# Will then call merge recursively on bigger sorted chunks

def mergeSort(arr)

  if (arr.length == 1)
    return arr
  end

  center = (arr.length / 2).floor
  left = arr[0...center] # takes values from 0 to center excluding the center index
  right = arr[center...arr.length] # takes values from center to end

  return merge( mergeSort(left), mergeSort(right) )
end

# left and right arguments are two sorted arrays.
# Merge them together into a sorted array
# While there are elements in both arrays, compare the first element in both
# Smallest one gets shifted to a new "results" array.  Then iterate

def merge(left, right)
  results = []

  while (left.length > 0 && right.length > 0)
    if (left[0] < right[0])
      results.push( left.shift() )
    else
      results.push( right.shift() )
    end
  end
  # return a new array. Take everything in results and add it to the array.
  # Take everything in left and add them in.
  # Take everything in right and add them as well.
  # One array will be empty after while loop finishes
  return [*results, *left, *right]
end

arr1 = Array.new(1000){rand(0...1000)}
arr2 = Array.new(arr1)

puts "====================1,000 items================================"

Benchmark.bm do |x|
  x.report("poorly_written_ruby")    {poorly_written_ruby(arr1)}
  x.report("time_optim         ")    {time_optim(arr2)}
end
