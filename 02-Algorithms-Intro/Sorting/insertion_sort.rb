# Insertion sort iterates over an unsorted collection and inserts each element in its preferred location in a new collection.
# The new collection is a sorted collection that is a partitioned part of the unsorted collection.

def insertion_sort(collection)
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0

    while sorted_collection_index < sorted_collection.length
      #            if val is smaller than current element in new sorted array, insert before it
      if val <= sorted_collection[sorted_collection_index]
        sorted_collection.insert(sorted_collection_index, val)
        break # break completely out of while loop
      #  When at the end of the new sorted array...after checking all elements, insert it at end
      elsif sorted_collection_index == sorted_collection.length - 1
        sorted_collection.insert(sorted_collection_index + 1, val)
        break     # break completely out of while loop
      end
      sorted_collection_index += 1
    end           # uses next val in collection after break
   end

  sorted_collection
end

# arr = Array.new(50){rand(0...50)}
# p insertion_sort(arr)
