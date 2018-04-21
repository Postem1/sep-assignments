require './bubble_sort'
require './selection_sort'
require './bucket_sort'
require './heap_sort'
require './insertion_sort'
require './merge_sort'
require './quick_sort'

require 'benchmark'

puts "====================1,000 items================================"

arr1 = Array.new(1000){rand(0...1000)}
arr2 = Array.new(arr1)
arr3 = Array.new(arr1)
arr4 = Array.new(arr1)
arr5 = Array.new(arr1)
arr6 = Array.new(arr1)
arr7 = Array.new(arr1)


Benchmark.bm do |x|
  x.report("bubble_sort   ")    {bubble_sort(arr1)}
  x.report("selection_sort")    {selection_sort(arr2)}
  x.report("insertion_sort") {insertion_sort(arr3)}
  x.report("merge_sort    ")     {merge_sort(arr4)}
  x.report("bucket_sort   ")    {bucket_sort(arr5,10)}
  x.report("quick_sort    ")     {quick_sort(arr6)}
  x.report("heap_sort     ")      {heap_sort(arr7)}
end

=begin
-for 10000 elements-

selection_sort  3.850000   0.000000   3.850000 (  3.858307)
bubble_sort     5.430000   0.010000   5.440000 (  5.447550)
bucket_sort     0.330000   0.000000   0.330000 (  0.332114)
heap_sort       0.020000   0.000000   0.020000 (  0.020293)
insertion_sort  1.610000   0.000000   1.610000 (  1.611600)
merge_sort      0.270000   0.130000   0.400000 (  0.395113)
quick_sort      0.030000   0.000000   0.030000 (  0.040507)
=end


=begin
Looking at the bar chart, speculate on why you think some sort algorithms are faster than others and provide rationale as to your thought process.

Some sorting algorithmns seem to be  faster depending on how often they have to iterate through the collection.  The more times it has to compare one element to another, the worse the algorithm's time.

I can speculate that some algorithmns are faster/slower depending on often it has to compare one item from the collection to another

The divide and conquer algorithms seem to work best base on the fact some portion of the collection can already be sorted hence no needed to compare an element to every other.
=end
