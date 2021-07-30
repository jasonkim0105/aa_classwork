def first_anagram?(str1, str2)
    possible_anagrams(str1).include?(str2)
end

def possible_anagrams(str)
    return [str] if str.length <= 1
    anagrams = []

    possible_anagrams(str[0...-1]).each do |anagram|
        (0..anagram.length).each do |i|
            anagrams << anagram.dup.insert(i, str[-1])
        end
    end
    anagrams
end


def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.each do |char|
        arr2.delete_at(arr2.index(char)) if arr2.include?(char)
    end
    arr2.empty?
end

def third_anagram?(str1, str2)

    str1.split('').sort == str2.split('').sort
end

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    str1.each_char {|char| hash1[char] += 1}
    str2.each_char {|char| hash2[char] += 1}

    hash1 == hash2
end


p fourth_anagram?("lives", "elvis")
p fourth_anagram?("gizmo", "sally")