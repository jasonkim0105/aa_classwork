require "byebug"
class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store= Array.new(max, false)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    end
    @store[num]=true
  end

  def remove(num)
    @store[num]=false
  end

  def include?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
    if @count == num_buckets
      resize!
    end

  end

  def remove(num)
    if self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # debugger
    num = num_buckets
    # if @count == num
    num *= 2
    # end

    temp_store = @store.flatten
    @store = Array.new(num) {Array.new}
    temp_store.each do |item|
      self[item] << item
    end


  end

end

# set= ResizingIntSet.new()

# p 21.times { |i| set.insert(i)}
