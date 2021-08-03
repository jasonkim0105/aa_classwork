class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    temp= 0
    self.each do |num|
      temp= temp.hash + num.hash
    end
    temp
  end
end

class String
  def hash
    alphabet= ("a".."z").to_a
    # alphabet+= ("A".."Z").to_a
    temp=0
    self.each_char do |char|
      temp= temp.hash+ alphabet.index(char).hash
    end
    temp
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    temp=0
    alphabet= ("a".."z").to_a
    self.each do |k, v|
      temp+= alphabet.index(k).hash + alphabet.index(v).hash
    end
    temp
  end
end
