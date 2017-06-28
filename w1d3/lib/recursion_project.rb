require 'byebug'

def merge_sort(arr)
  return [arr[0]] if arr.length == 1
  idx = arr.length/2
  halves = [arr[0...idx], arr[idx..-1]]
  result = []
  halves.each do |half|
    result << merge_sort(half)
  end
  merge(result)
end

def merge(pair)
  result = []
  if pair.all? { |arr| arr == arr.flatten }
    until pair[0].empty? && pair[1].empty?
      first_num = pair[0].first || pair[1].first
      second_num = pair[1].first || pair[0].first
      result << pair[0].shift if first_num <= second_num
      result << pair[1].shift if first_num >= second_num
      result.compact!
    end
    result
  else
    [merge(pair[0]), merge(pair[1])]
  end
end

def b_search(arr, target)
  idx = arr.length/2
  return idx if arr[idx] == target
  if arr[idx] > target
    b_search(arr[0...idx], target)
  else arr[idx] < target
    idx + b_search(arr[idx..-1], target)
  end

end

def permutations(arr)
  return [arr, arr.reverse] if arr.length == 2
  result = []
  arr.each_index do |i|
    smaller_arr = arr[0...i]
    smaller_arr += arr[i+1..-1] unless i == arr.length-1
    #result << [arr[i]] + smaller_arr
    #debugger
    permutations(smaller_arr).each do |perm|
      result << [arr[i]] + perm
    end
  end
  result
end

def array_subsets(arr)
  debugger
  return [arr] if arr.empty?
  small_subsets = []
  large_subsets = []
  array_subsets(arr[0...-1]).each do |subset|
    small_subsets << subset
    large_subsets << subset + [arr[-1]]
  end
  small_subsets + large_subsets
end

def r_fibonacci(n)
  return [0,1] if n == 2
  y = r_fibonacci(n-1)[-1]
  x = r_fibonacci(n-1)[-2]
  r_fibonacci(n-1) << x + y
end


def fibonacci(n)
  results = [0,1]
  return results[0] if n==1
  return results if n==2
  (n-2).times do |i|
    results << results[i] + results[i+1]
  end
  results
end

def deep_copy(arr)
  return arr.dup if arr == arr.flatten
  new_arr = arr.dup
  new_arr.each_index do |i|
    new_arr[i] = deep_copy(new_arr[i]) if new_arr[i].is_a?(Array)
  end
  new_arr
end
#deep_copy([5,["a","b"],"string",["c",["d","e"]]])
def exp(base, num)
  return 1 if num == 0
  base * exp(base, num-1)
end

def exp2(base, num)
  return 1 if num == 0
  return base if num == 1
  if num.even?
    exp2(base, num / 2) * exp2(base, num/2)
  else
    base * exp2(base, (num- 1) / 2) ** 2
  end
end

def range(first, last)
  return [] if first > last
  [first] + range(first + 1, last)
end

def arr_sum(arr)
  return arr[0] if arr.length == 1
  sum = arr[-1]
  sum += arr_sum(arr[0...-1])
end





if __FILE__ == $PROGRAM_NAME
  merge_sort([2,1,6,3,5,9,7,4])
end
