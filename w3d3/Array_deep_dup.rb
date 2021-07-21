class Array

    def deep_dup

        self.map do |sub|
            if sub.is_a?(Array)
                sub.deep_dup
            else
                sub
            end
        end

    end

end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

robot_parts_copy[1] << "LEDs"

p robot_parts.deep_dup



# return [] if arr.length == 0

# [1, [2], [3, [4]]].map do |1|
#     if sub.is_a?(Array) # no
#         [deep_dup(arr)]
#     else
#         sub # 1
#     end
# end
# [1]



# [1, [2], [3, [4]]].map do |[2]|
#     if sub.is_a?(Array) # yes
#         [deep_dup([2])]
#     else
#         sub
#     end
# end


#     [2].map do |2|
#         if sub.is_a?(Array) # no
#             [deep_dup(arr)]
#         else
#             sub # 2
#         end
#     end

# [1, [2]]


# [1, [2], [3, [4]]].map do |[3,[4]]|
#     if sub.is_a?(Array)#yes
#         [deep_dup([3,[4]])]
#     else
#         sub
#     end
# end

#     [3, [4]].map do |3| # 3, [4]
#         if sub.is_a?(Array)
#             [deep_dup(arr)]
#         else
#             sub # 3
#         end
#     end

#     [3, [4]].map do |[4]|
#         if sub.is_a?(Array)#yes
#             [deep_dup([4])] # = [4]
#         else
#             sub
#         end
#     end

#         [4].map do |4|
#             if sub.is_a?(Array) # no
#                 [deep_dup(arr)]
#             else
#                 sub #4
#             end
#         end


