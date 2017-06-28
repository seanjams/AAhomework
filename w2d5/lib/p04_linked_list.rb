class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
    @prev = nil
    @next = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    link = first
    i.times do
      link = link.next
    end
    link
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    return nil if empty?
    link = first
    until link == @tail
      if link.key == key
        return link.val
      else
        link = link.next
      end
    end
  end

  def include?(key)
    get(key).nil? ? false : true
  end

  def append(key, val)
    link = Link.new(key, val)
    link.next = @tail
    link.prev = @tail.prev
    @tail.prev.next = link
    @tail.prev = link
  end

  def update(key, val)
    return if first.nil?
    link = first
    until link == @tail
      if link.key == key
        link.val = val
        break
      end
      link = link.next
    end
  end

  def remove(key)
    link = first
    until link == @tail
      if link.key == key
          link.remove
        break
      end
      link = link.next
    end
  end

  def each(&block)
    # debugger
    link = first
    until link == @tail
      block.call(link)
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

# l = LinkedList.new
# l.append(:a, 1)
# l.append(:b,2)
# l.append(:c,3)
# p l.to_s
