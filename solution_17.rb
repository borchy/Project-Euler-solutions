# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?

# NOTE: Do not count spaces or hyphens. 
# For example, 342 (three hundred and forty-two) contains 23 letters 
# and 115 (one hundred and fifteen) contains 20 letters. 
# The use of "and" when writing out numbers is in compliance with British usage.

# 1 to 1000 = 21124

class NumberToWord
  def initialize(from, to)
    @from, @to = from, to
    # TODO: generic
    @numbers = { 1 => 'one', 
           2 => 'two', 
           3 => "three", 
           4 => "four", 
           5 => "five", 
           6 => "six", 
           7 => "seven", 
           8 => "eight", 
           9 => "nine", 
           10 => "ten",
           11 => "eleven",
           12 => "twelve",
           13 => "thirteen",
           14 => "fourteen",
           15 => "fifteen",
           16 => "sixteen",
           17 => "seventeen",
           18 => "eighteen",
           19 => "nineteen",
           20 => "twenty",
           30 => "thirty",
           40 => "forty",
           50 => "fifty",
           60 => "sixty",
           70 => "seventy",
           80 => "eighty",
           90 => "ninety",
           1000 => "onethousand" }
  end
  
  def number_to_word(number)
    unless @numbers.keys.include? number
      if number < 100
        @numbers[number] = @numbers[number / 10 * 10] + "" + number_to_word(number % 10)
      else
        # TODO: shorter
        if (number % 100 > 0)
          # TODO: find out if it's neccessary           
          @numbers[number] = @numbers[number / 100] + "hundred" + "and" + number_to_word(number % 100)        
        else
          @numbers[number] = @numbers[number / 100] + "hundred"
        end
      end
    end
    
    return @numbers[number]
  end  
  
  def solver
    # TODO: inject
    sum = 0
    for x in @from..@to
      sum += number_to_word(x).size
    end
    return sum
  end
end
