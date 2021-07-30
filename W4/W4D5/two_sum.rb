def two_sum?(arr, target_sum)

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
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false