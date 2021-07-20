# w3d1 classwork with jason k. & jon z.


class Array
  def my_each(&prc)
      i = 0
      while i < self.length
          prc.call(self[i])
          i += 1
      end
      self
  end

  def my_select(&prc)
    result = []
    self.my_each do |ele|
        result << ele if prc.call(ele)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |ele|
        result << ele if !prc.call(ele)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |ele|
        return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
        return false if !prc.call(ele)
    end
    true
  end

  def my_flatten

    return [self] if !self.is_a?(Array)
    flattened = []
    self.each { |arr| flattened += self.my_flatten }
    flattened


    # return [self] if self.is_a?(String)
    # result = []
    # self.each do |ele|

    #     if self.is_a?(Array)
    #         result += self.my_flatten
    #     end
    # end
    # result
  end


end

[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# [] += [7] = [7] += [5, 6] = [7, 5, 6]