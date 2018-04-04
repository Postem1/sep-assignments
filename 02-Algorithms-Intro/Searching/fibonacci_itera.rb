require 'benchmark'

def fib(n)
  results = [0,1] #first fib numbers

  2.upto(n) do |i|
    a = results[i - 1]
    b = results[i - 2]

    results.push(a + b) #push in the sum of the previous two numbers into the array
  end

  return results[n]
end

puts Benchmark.measure { fib(20) }

 puts fib(0)
 puts fib(1)
 puts fib(2)
 puts fib(3)
 puts fib(4)
 puts fib(5)
 puts fib(6)
 puts fib(7)
 puts fib(8)
 puts fib(9)
 puts fib(10)
