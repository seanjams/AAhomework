require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array

  def hash
    # debugger
    result = []
    self.each do |int|
      result << int.hash.abs
    end
    result
    result.join.to_i
  end

end

a = [1,2,3]
b = [1,2,3,4]
a.hash
b.hash

class String
  ALPHA = ("a".."z").to_a

  def hash
    result = []
    self.each_char do |ch|
      result << ALPHA.index(ch).hash.abs
    end
    result.join.to_i
  end
end

class Hash
  ALPHA = ("a".."z").to_a
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.keys.each do |key|
      result += ALPHA.index(key).hash.abs + self[key].hash.abs
    end
    result
  end
end
