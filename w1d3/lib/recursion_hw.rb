def sum_to(n)
  if n <= 0
    nil
  elsif n == 1
    n
  else
    n + sum_to(n-1)
  end
end
#
# Test Cases
sum_to(5)  # => returns 15
sum_to(1)  # => returns 1
sum_to(9)  # => returns 45
sum_to(-8)  # => returns nil

def add_numbers(nums_array)
  if nums_array.length == 1
    nums_array[-1]
  elsif nums_array.length == 0
    nil
  else
    last_num = nums_array.pop
    nums_array[-1] += last_num
    add_numbers(nums_array)
  end
end

# Test Cases
add_numbers([1,2,3,4]) # => returns 10
add_numbers([3]) # => returns 3
add_numbers([-80,34,7]) # => returns -39
add_numbers([]) # => returns nil

def gamma_fnc(n)
  if n <= 0
    nil
  elsif n == 1
    1
  else
    ( n - 1 ) * gamma_fnc( n - 1 )
  end
end

gamma_fnc(0)  # => returns nil
gamma_fnc(1)  # => returns 1
gamma_fnc(4)  # => returns 6
gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
  return false if flavors == []
  favorite == flavors.pop || ice_cream_shop(flavors, favorite)
end

# Test Cases
#ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
#ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
#ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
#ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0..-2])
end

# Test Cases
reverse("house") # => "esuoh"
reverse("dog") # => "god"
reverse("atom") # => "mota"
reverse("q") # => "q"
reverse("id") # => "di"
reverse("") # => ""
