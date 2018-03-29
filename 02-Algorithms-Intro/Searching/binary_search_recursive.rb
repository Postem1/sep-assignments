

def binary_search(arr, value )
  low ||= arr[0]
  high ||= arr[-1]
  mid ||= (low + high) / 2
  
if value < low || value > high
  return "Value is not in the array"
elsif arr[mid] == value
    return "#{value} found at position #{mid}"
  elsif arr[mid] > value
    high = mid - 1
    low = arr[0]
    mid = (low + high) / 2
    binary_search(arr, value)
  elsif arr[mid] < value
    low = mid + 1
    high = arr[-1]
    mid = (low + high) / 2
    binary_search(arr, value)
  else
    return "#{value} not found in this collection"
  end
end
