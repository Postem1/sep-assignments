

# I improved code optimization by combining the arrays using the flatten method.
# Doing so eliminated a loop through the input array.
# This also improves space complexity by using only one array instead of two.
# An interation through the while loop was avoided by adding a check when the
# sorted array is initially empty.

def code_optim(*arrays)
  sorted_array = []

  arrays.flatten.each do |val_in_loop|
    len = sorted_array.length

    if len == 0
      sorted_array << val_in_loop
    else
      i = 0

      while i < len
        val_in_array = sorted_array[i]
        if val_in_array > val_in_loop
          sorted_array.insert(i, val_in_loop)
          break
        elsif i == len - 1
          sorted_array << val_in_loop
          break
        end
        i += 1
      end
    end
  end

  # Return the sorted array
  sorted_array
end
