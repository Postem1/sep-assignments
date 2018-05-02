require './poorly_written_ruby'
require 'benchmark'

def space_optim(*array)
  array.flatten!
  i = 0
  
  while i < (array.length)
    j = 0

    while j < (array.length - i - 1)
      if array[j] > array[j + 1]
       array[j], array[j + 1] = array[j + 1], array[j]
      end
      j += 1
    end

    i += 1
  end

  array
end

arr1 = Array.new(1000){rand(0...1000)}
arr2 = Array.new(arr1)

puts "====================1,000 items================================"

Benchmark.bm do |x|
  x.report("poorly_written_ruby")    {poorly_written_ruby(arr1)}
  x.report("space_optim        ")    {space_optim(arr2)}
end
