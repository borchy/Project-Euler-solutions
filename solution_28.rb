# find the sum of the diagonals of a 1001x1001 spiral matrix

a = b = c = d = 1
sum = 1

n = 3
while n <= 1001
  # TODO: you can find a function, not a sequence, but it won't help, it'll just show how bad ass of a mathematician you are :)
  # yep...tried and failed
  a += 4 * n - 10
  b += 4 * n - 8
  c += 4 * n - 6
  d += 4 * n - 4
  
  sum += a + b + c + d

  n += 2
end
  
puts sum
