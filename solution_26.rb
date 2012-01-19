def order_of_10 number
  pow = 1
  while true
    return pow if (10 ** pow) % number == 1
    pow += 1
  end
end

def prime? number
  lim = Math::sqrt(number).to_i
  for x in 2..lim
    return false if number % x == 0
  end
  return true
end

def solver 
  max_den = 0
  max_cycle = 0
  for den in 2...1000
    if prime?(den) and den != 2 and den != 5
      cycle_length = order_of_10(den)
      if cycle_length > max_cycle
        max_cycle = cycle_length
        max_den = den
      end
    end
  end
  return max_den
end

puts solver
