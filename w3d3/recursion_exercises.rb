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