# find the sum of all amidable numbers smaller than 10 000

def divisors_sum number
  sum = 1
  lim = Math::sqrt(number).to_i
  
  for x in 2..lim
    if (number % x == 0)
      sum += x 
      sum += number / x      
    end
  end
  
  return sum
end

def amicable_pair?(num1, num2)
  divisors_sum(num1) == num2 and divisors_sum(num2) == num1
end

def solver(from, to)
  sum = 0
  
  for x in from..to
    y = divisors_sum(x)
    if (y > x) 
      if amicable_pair?(x, y)
        sum += (x + y) 
        puts "(#{x}, #{y})"
      end
    end
  end
  
  return sum
end

puts solver(1, 100000)
