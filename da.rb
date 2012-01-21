# 01.01.1900 was a Monday
# between 01.01.1901 and 31.12.2000
# how many Sundays fell on the first day
# answer - 171

class MyDate
  attr_reader :day, :month, :year

  def initialize(day, month, year)
    @day, @month, @year = day, month, year
  end
  
  # TODO: needs unit test
  def days_in_month(month, year)
    days_per_month = { 1 => 31, 2 => 28 + (leap?(year) ? 1 : 0), 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 }  
    if (month == 0)
      return days_per_month[12]
    elsif (month < 0)
      return days_per_month[month % 13]
    else
      return days_per_month[month]      
    end
  end
  
  # TODO: needs unit test
  def increment_by_days count
    new_day = @day
    new_month = @month
    new_year = @year                
  
    while count > 0
      days_to_next_month = days_in_month(new_month, new_year) - new_day + 1
      
      if (days_to_next_month > count)
        new_day = new_day + count
        count = 0       
      else
        new_day = 1
        new_month = new_month + 1
        if (new_month > 12)
          new_month = 1
          new_year = new_year + 1
        end
        
        count = count - days_to_next_month   
      end
    end
    
    return MyDate.new new_day, new_month, new_year
  end
  
  # TODO: needs thinking
  # TODO: needs unit test
  def decrement_by_days count
    new_day = @day
    new_month = @month
    new_year = @year                
  
    while count > 0
      days_to_previous_month = days_in_month(new_month - 1, new_year) + new_day - 1
      
      if (new_day > count)
        new_day = new_day - count
        count = 0       
      else
        new_day = days_to_previous_month - count
        new_month = new_month - 1
        if (new_month < 1)
          new_month = 12
          new_year = new_year - 1
        end
        
        count = count - days_to_previous_month
      end
    end
    
    return MyDate.new new_day, new_month, new_year
  end
  
  def to_s
    "#{day}.#{month}.#{year}"
  end
  
  def -(value)
    # TODO: implement da madafaka
  end
  
  # TODO: needs unit test
  def <=(value)
    self < value or self == value
  end

  # TODO: needs unit test
  def <(value)
    if (year < value.year)
      return true
    elsif (year == value.year)
      if (month < value.month)
        return true
      elsif (month == value.month)
        return day < value.day
      else
        return false
      end
    else
      return false
    end
  end
  
  def ==(value)
    year == value.year and month == value.month and day == value.day
  end

  def leap? year
    year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)
  end
end

# TODO: needs unit test
# TODO: It shouldn't require the weekday
def solver(from_date, to_date, weekday)
  result = 0
  days_to_sunday = 7 - weekday
  new_date = from_date.increment_by_days days_to_sunday
  if (new_date.day == 1)
    result = result + 1
  end
  while new_date <= to_date
    if (new_date.day == 1)
      result = result + 1
    end
    new_date = new_date.increment_by_days 7
  end
  return result
end

from_date = MyDate.new 12, 1, 1901
to_date = MyDate.new 31, 12, 2000
weekday = 2

#puts solver(from_date, to_date, weekday)

puts from_date.decrement_by_days 100

