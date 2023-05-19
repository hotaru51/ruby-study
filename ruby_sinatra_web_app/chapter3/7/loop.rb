# frozen_string_literal: true

def prime_number?(num)
  return false if num <= 1

  result = true
  (2..(num - 1)).each do |n|
    if (num % n).zero?
      result = false
      break
    end
  end

  result
end

prime_numbers = []
current = 1

while prime_numbers.length < 20
  prime_numbers.push(current) if prime_number?(current)
  current += 1
end

puts prime_numbers
