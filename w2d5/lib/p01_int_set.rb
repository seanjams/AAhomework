require "byebug"

class MaxIntSet
  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    if num.between?(0,@store.size)
      return true
    else
      raise "Out of bounds"
    end
  end

  def validate!(num)
    @store[num]
  end
end

# m = MaxIntSet.new(3)
# p m
# m.insert(1)
# p m


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
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
    @store[num % @store.size]
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
    # debugger
    # @count = 0 if @store.empty?
    unless include?(num)
      if @store.size == @count
        resize!
      end
        self[num] << num
        @count += 1
    end
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
    @store[num % @store.size]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = @store.dup
    @store = Array.new(@store.size * 2) {[]}
    prev_store.each do |bucket|
      bucket.each do |el|
        @store[el] << el
      end
    end
  end
end

r = ResizingIntSet.new(2)
r.insert(1)
r.insert(2)
r.insert(3)
