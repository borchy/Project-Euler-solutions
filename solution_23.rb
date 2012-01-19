@@hash = Hash.new(false)

def abundant? number
  divisors_sum(number) > number
end

def even? number
  number % 2 == 0
end

def divisors_sum number
  sum = 1
  lim = Math::sqrt(number).to_i
  
  x = even?(number) ? 2 : 3
  step = even?(number) ? 1 : 2
  while (x <= lim)
    if (number % x == 0)
      sum += x 
      sum += number / x      
    end
    x += step    
  end
  
  if (lim ** 2 == number)
    return sum - lim
  else
    return sum
  end
  
end

def generate_abuntant_numbers! limit
  for x in 12..limit
    @@hash[x] = true if abundant?(x)
  end
end

def sum_of_two_abundant_numbers? number
  for x in 0..(number / 2)
    if (@@hash[x] and @@hash[number - x])
      return true
    end
  end
  return false
end

def solver
  generate_abuntant_numbers! 22000
  
  sum = 0
  
  for x in 1..21123
    if x % 1000 == 0
      puts x
    end
    unless sum_of_two_abundant_numbers? x
      sum += x
    end
  end
  
  return sum
end

puts solver
