def windowed_max_range(array, wSize)
  current_max_range = 0
  (0...array.length - wSize + 1).each do |i|
    window = array.slice(i, wSize)
    current_range = window.max - window.min
    current_max_range = current_range if current_range > current_max_range
  end
  current_max_range

end


p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8