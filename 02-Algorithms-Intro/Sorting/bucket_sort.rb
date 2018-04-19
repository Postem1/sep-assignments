# require 'benchmark'

require './insertion_sort'

def bucket_sort(collection, numberOfBuckets)

  highestNumber = 0
  for i in collection
    if i > highestNumber
      highestNumber = i
    end
  end

  bucketSize = (highestNumber / numberOfBuckets)
  buckets = []
  currentBucket = 0

  while currentBucket < numberOfBuckets
    buckets << []
    currentBucket += 1
  end

  iteration = 1

  while iteration <= numberOfBuckets
    collection.each do |n|
      if iteration == 1 && n <= (bucketSize * iteration)
        buckets[(iteration - 1)] << n
      elsif n <= (bucketSize * iteration) && n > (bucketSize * (iteration - 1))
        buckets[(iteration - 1)] << n
      end
    end
    iteration += 1
  end

  result = []
  buckets.each do |j|
    if j.length == 1
      result.push(j[0])
    elsif j.length > 1
      sorted = insertion_sort(j)
      sorted.each do |k|
        result.push(k)
      end
    end
  end

  result
end

 # arr = Array.new(50){rand(0...50)}
 # p bucket_sort(arr, 5)

 #
 # puts "====================10,000 items================================"
 #
 # arr1 = Array.new(10000){rand(0...10000)}
 # arr2 = Array.new(arr1)
 # arr3 = Array.new(arr1)
 # arr4 = Array.new(arr1)
 # arr5 = Array.new(arr1)
 # arr6 = Array.new(arr1)
 #
 #
 # Benchmark.bm(50) do |x|
 #   x.report("bucket_sort 5    ")    {bucket_sort(arr1,5)}
 #   x.report("bucket_sort 10   ")    {bucket_sort(arr2,10)}
 #   x.report("bucket_sort 20   ")    {bucket_sort(arr3,20)}
 #   x.report("bucket_sort 40   ")    {bucket_sort(arr4,40)}
 #   x.report("bucket_sort 50   ")    {bucket_sort(arr5,50)}
 #   x.report("bucket_sort 100   ")    {bucket_sort(arr6,100)}
 # end
 #
 # ====================10,000 items================================
 #                          user     system      total        real
 # bucket_sort 5          0.330000   0.000000   0.330000 (  0.338554)
 # bucket_sort 10         0.180000   0.000000   0.180000 (  0.174337)
 # bucket_sort 20         0.100000   0.000000   0.100000 (  0.104646)
 # bucket_sort 40         0.080000   0.000000   0.080000 (  0.080463)
 # bucket_sort 50         0.080000   0.010000   0.090000 (  0.080848)
 # bucket_sort 100        0.110000   0.000000   0.110000 (  0.109015)
