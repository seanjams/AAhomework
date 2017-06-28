require_relative 'p02_hashing'


class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
          if @store.size == @count
            resize!
          end
            self[key.hash] << key
            @count += 1
        end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
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

# class ResizingIntSet
#   attr_reader :count
#
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
#
#   def insert(num)
#     # debugger
#     # @count = 0 if @store.empty?
#     unless include?(num)
#       if @store.size == @count
#         resize!
#       end
#         self[num] << num
#         @count += 1
#     end
#   end
#
#   def remove(num)
#     self[num].delete(num)
#   end
#
#   def include?(num)
#     self[num].include?(num)
#   end
#
#   private
#
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#     @store[num % @store.size]
#   end
#
#   def num_buckets
#     @store.length
#   end
#
#   def resize!
#     prev_store = @store.dup
#     @store = Array.new(@store.size * 2) {[]}
#     prev_store.each do |bucket|
#       bucket.each do |el|
#         @store[el] << el
#       end
#     end
#   end
# end
