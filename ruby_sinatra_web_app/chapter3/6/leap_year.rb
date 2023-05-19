# frozen_string_literal: true

def leap_year?(year)
  if (year % 4).zero? && !((year % 100).zero? && year % 400 != 0)
    true
  else
    false
  end
end

[1900, 2100, 1600, 2000].each { |num| puts "#{num}: #{leap_year? num}" }
