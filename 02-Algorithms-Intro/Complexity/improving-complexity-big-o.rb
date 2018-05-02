=begin

Find the Big-O of each version?

puts Big-O of version one?
  Version one has a nested loop, and is very simlar to insertion sort, therefore it's Big-O is (n^2)

Big-O of version two?
  The Big-O of version two is a merge sort algorithm.
  The big-O of this is (n log n)

Big-O of version three?
  This version improves the space complexity. We are mainly concerning about preserving memory.
  We want to avoid creating additional variables and/or arrays.
  A bubble sort algorithm uses the same array (in place) and simply changes the index of the elements at different iterations.
  The Big-O for this version is (n^2) because of the nested loops

=end
