class Array
  def my_uniq
    hash = Hash.new {|h,k| h[k] = 0}
    self.each do |el|
      hash[el] += 1
    end
    hash.keys
  end

  def two_sum
    res = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        if self[i] + self[j] == 0
          res << [i, j]
        end
      end
    end
    res
  end

  def my_transpose
    i = 0
    newArr = Array.new(self.length) {[]}
    while i < self.length
      self.each do |subArr|
        newArr[i] << subArr[i]
      end
      i+= 1
    end
    newArr
  end

end