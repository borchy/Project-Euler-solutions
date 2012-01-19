# find the millionth lexicographical permutation of the numbers from 0 to 9

def factorial number
  return 1 if number == 0
  return number * factorial(number - 1)
end

def solver(array, index)
  new_array = []
  x = array.length - 1
  
  while (x >= 0)
    new_array << index / factorial(x)
    index -= new_array.last * factorial(x)
    x -= 1
  end
  
  return get_answer(array, new_array)
end

def get_answer(array, index_array)
  result = []
  index_array.each do |index|  
    result << array[index]
    array.delete(array[index])
  end
  return result
end

print solver(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"], 999999)
