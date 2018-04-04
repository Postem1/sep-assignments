


def iterative (arr, value)
  first = 0
  last = arr.length - 1

  while first <= last
    mid = (first + last) / 2

    if arr[mid] == value
      return "#{value} found at position #{mid}"
    elsif arr[mid] > value
      last = mid - 1
    elsif arr[mid] < value
      first = mid + 1
    else
      return "#{value} not found in this collection"
    end
  end
end

arra = [1,2,3,4,5,6,6,7,7,8]

iterative(arra,4)
