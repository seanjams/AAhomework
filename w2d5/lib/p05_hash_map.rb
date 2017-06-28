require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count, :store
  #include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if self.include?(key)
      bucket(key).update(key, val)
    else
      @count += 1
      bucket(key).append(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each(&blk)
    @store.each do |list|
      list.each do |link|
        blk.call(link.key, link.val) if link.key && link.val
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end

# class HashSet
#   attr_reader :count
#
#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end
#
#   def insert(key)
#     unless include?(key)
#           if @store.size == @count
#             resize!
#           end
#             self[key.hash] << key
#             @count += 1
#         end
#   end
#
#   def include?(key)
#     self[key.hash].include?(key)
#   end
#
#   def remove(key)
#     self[key.hash].delete(key)
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
#         @store = Array.new(@store.size * 2) {[]}
#         prev_store.each do |bucket|
#           bucket.each do |el|
#             @store[el] << el
#           end
#         end
#   end
# end
