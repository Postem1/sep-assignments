

# Conceptually, merge sort has two steps.
# Merge sort breaks a collection of n items into n sub-collections.
# Each collection of one item is considered sorted, by definition.
# Merge sort then merges individual sub-collections to produce sorted sub-collections.
# It does this repeatedly until there are no sub-collections to sort.


def merge_sort(collection)
   if collection.length <= 1
     collection
   else
     mid = (collection.length / 2).floor
     left = merge_sort(collection[0..mid - 1])
     right = merge_sort(collection[mid..collection.length])
     merge(left, right)
   end
 end

 def merge(left, right)
   if left.empty?
     right
   elsif right.empty?
     left
   elsif left.first < right.first
     [left.first] + merge(left[1..left.length], right)
   else
     [right.first] + merge(left, right[1..right.length])
   end
 end

 # arr = Array.new(50){rand(0...50)}
 # p merge_sort(arr)
