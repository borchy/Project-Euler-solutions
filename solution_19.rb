# 01.01.1900 was a Monday
# between 01.01.1901 and 31.12.2000
# how many Sundays fell on the first day
# answer - 171

class MyDate
  def initialize
    @days_per_month = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }  
  end

  def solver
    result = 0
    # TODO: depends on weekday
    total_days = 1
    
    # TODO: doesn't work for boundary cases
    for year in 1901..2000
      for month in 1..12
        days_in_month = @days_per_month[month]
        if (month == 2 and (year % 4 == 0 or (year % 100 != 0 or year % 400 == 0)))
          days_in_month += 1
        end
        total_days += days_in_month
        if (total_days % 7 == 6)
          result += 1
        end
      end
    end
    
    return result
  end
end

a = MyDate.new
puts a.solver
