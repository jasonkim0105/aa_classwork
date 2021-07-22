
def range_recursive(start, last)

    return [] if last == start

    [start] + range_recursive(start + 1, last)

end

# p range_recursive(1,5)

def exp(b, n) #
  #exp (3, 5) -> 3 * exp(3,4)
  #exp (3, 4) -> 3 * exp (3,3)
  #exp (3, 3) -> 3 * exp(3,2)
  #exp (3, 2) -> 3 * exp (3,1)
  #exp (3, 1) -> 3 * exp(3,0)


  return 1 if n == 0
  return b if n == 1

  if n % 2 == 0
    exp(b, n/2) ** 2
  else
    b * (exp(b, (n-1) / 2) ** 2)
  end

  # exp(b, n/2) ** 2
    #exp(2, 4) -> exp(2,2) ** 2
                  #exp(2, 1) ** 2

  # b * (exp(b, (n-1) / 2) ** 2)
  #  3 * (exp (3, (3-1) / 2) ** 2)
  #                 2 /2
  #   3 * (exp (3, 1) ** 2)
  #   3 *   3 ** 2 -> 27
end

# p exp(3, 4)
# p exp(3, 5)
# p exp(4, 4)

#fib: 0, 1, 1, 2, 3, 5, 8
#idx: 0, 1, 2, 3, 4, 5, 6

def fib_iter(n) #fib_iter(4) -> [0, 1, 1, 2, 3]
  return [0] if n == 0
  return [0, 1] if n == 1
  i = 2
  arr = [0, 1]
  while i < n
    fib = arr[i-1].to_i + arr[i-2].to_i
    arr << fib
    i += 1
  end
  arr
end

# p fib_iter(4)
# p fib_iter(1)
# p fib_iter(10)


#fib: 0, 1, 1, 2, 3, 5, 8
#nth: 1, 2, 3, 4, 5, 6

def fib_recur(n) #fib_recur(4) -> [0, 1, 1, 2, 3]
  return [] if n == 0
  return [0]  if n == 1
  return [0, 1] if n == 2

  fibz =fib_recur(n-1)
  fibz << fibz[-1] + fibz[-2]
  fibz

end



#find middle index
# compare target to middle index
#   if ==, return index
# if target < mid, search mid of left side
# if target > mid, search mid of right side
# repeat until target == mid element, OR everything has been searched



def bsearch(arr, target)

    return nil if arr.length == 0

  
    mid_i = arr.length / 2


    return mid_i if target == arr[mid_i]

    if target < arr[mid_i]
        bsearch(arr[0...mid_i], target)
    else target > arr[mid_i]
        right = bsearch(arr[mid_i+1..-1], target)
        return nil if right == nil
        right + mid_i + 1
    end

end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

