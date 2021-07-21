def range_recursive(start, last)

    return [] if last == start

    [start] += range_recursive(start + 1, last)
                            
end

p range_recursive(1,5)

