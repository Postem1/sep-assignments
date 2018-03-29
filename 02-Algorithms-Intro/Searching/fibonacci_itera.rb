require 'benchmark'

 def fib(n)
  if n == 0
     return 0
  else
      i = 1
      fib_1 = 0
      fib_2 = 1

      while i < n
        temp = fib_2
        fib_2 = fib_1 + fib_2
        fib_1 = temp
        i += 1
      end

    return fib_2
  end
end

puts Benchmark.measure { fib(20) }

 # puts fib(0)
 # puts fib(1)
 # puts fib(2)
 # puts fib(3)
 # puts fib(4)
 # puts fib(5)
 # puts fib(6)
 # puts fib(7)
 # puts fib(8)
 # puts fib(9)
 # puts fib(10)
