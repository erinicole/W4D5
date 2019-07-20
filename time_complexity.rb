def my_min(arr)
  arr.each do |el|
    return el if arr.all? { |el_2| el <= el_2 }
  end
end

def my_min2(arr)
  tracker = arr.first
  arr.each do |el|
    if tracker > el
      tracker = el
    end
  end
  tracker
end

def largest_contiguous_subsum(list)
  storage = list[0]
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sum = list[i..j].sum
      if sum > storage
        storage = sum
      end
    end
  end
  storage
end

def largest_contiguous_subsum2(list)
  current_max = list.first
  contiguous_sum = 0

  list.each do |el|
    contiguous_sum += el
    if el > contiguous_sum
      contiguous_sum = el
    end
    if contiguous_sum > current_max
      current_max = contiguous_sum
    end
  end

  current_max
  
end



# def first_anagram?(first, second)
#   storage = first[0]
#   (0...first.length).each do |i|
#     (i...first.length).each do |j|
#       word = first[i..j]
#       if word == word.reverse
#         storage << word
#       end
#     end
#   end
#   storage.include?(second)
# end

def first_anagram?(first, second)

  hash_first = Hash.new(0)
  first.each_char {|char| hash_first[char] += 1}

  hash_second = Hash.new(0)
  second.each_char {|char| hash_second[char] += 1}


  hash_first == hash_second
end

def second_anagram?(first, second)
  first.each_char do |char|
    i = second.chars.find_index(char)
    if i != nil
      second = second.chars
      second.delete_at(i)
      second = second.join("")
    else
      return false
    end
  end
  return true if second == ""
  false
end

def third_anagram?(first, second)
  first.sort == second.sort 
end