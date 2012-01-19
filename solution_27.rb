@@arr_primes = (2...1000).to_a
@@a = []
@@b = []

def prime? number
  return false if number < 2
  lim = Math::sqrt(number).to_i
  for x in 2..lim
    return false if number % x == 0
  end
  return true
end

def init
  @@arr_primes.keep_if { |number| prime? number }  
  @@arr_primes.each { |number| @@a << number; @@a << -number; @@b << number }
end

def number_of_consequtive_primes(a, b)
  n = 0
  while true
    number = n**2 + a*n + b
    if prime? number
      n += 1
    else
      break
    end
  end
  return n
end

def solver
  init
  max_primes = 0
  best_pair = [0, 0]
  @@a.each do |a|
    @@b.each do |b|
      primes_count = number_of_consequtive_primes(a, b)
      if primes_count > max_primes
        max_primes = primes_count
        best_pair = a, b
      end
    end
  end
  return best_pair[0], best_pair[1]
end

puts solver
