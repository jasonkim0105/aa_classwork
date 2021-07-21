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
  # arr = [0, 1]
  # (2..n).each do |num|
  #   arr << fib_recur(num-1)[-1] + fib_recur(num-2)[-1]

  # end
  # arr

  #fib_recur(3) ->      fib(2)        +      fib(1)

  # p fib
  # arr << fib
            #fib_recur(3)  +        fib_recur(2) - > 3
  #fib_recur(2) + fib_recur(1)    fib_recur(1) + fib_recur(0) -> 1


p fib_recur(2)
p fib_recur(4)
p fib_recur(10)