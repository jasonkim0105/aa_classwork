def two_sum?(arr, target_sum)
  hash = Hash.new(0)
  arr.each do |num|
    y = target_sum - num
    return true if hash[y]
    hash[x] = true
  end
  return false
end


def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |i|
    (i+1 ...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  return false
end

def okay_two_sum?(arr, target_sum)
  arr = arr.sort
  # arr.each_with_index do |el, i|
  # !arr.bsearch {|x| x >= target_sum}
  # end
  # x = arr[0]
  arr.each_with_index do |ele,i| 
    x = arr[i]
    y = arr.bsearch {|x| target_sum - x}
    x + y == target_sum
  end
end



arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false