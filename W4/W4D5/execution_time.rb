def my_min(array)
  # min = 0
  # array.each do |num|
  #   min = num if num  <  min
  # end
  # min
  min = array.first
  array.each do |num|
    newArray = array[0 + 1.. -1]
    newArray.each do |otherNums|
      if otherNums < min
        min = otherNums
      end
    end
  end
  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(array)
  newArr = []
  (0...array.length).each do |i|
    (0...array.length).each do |j|
      newArr << array[i..j]
    end
  end
  max = 0
  newArr.each do |subArray|
    max = subArray.sum if subArray.sum > max
  end
  max
end

def largest_contiguous_subsum(array)
  max = array.first
  curr = array.first

  (1...array.length).each do |i|
    curr += array[i]
    max = curr if curr > max
  end
  max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8