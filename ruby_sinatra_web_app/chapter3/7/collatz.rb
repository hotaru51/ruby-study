# frozen_string_literal: true

def collatz(num)
  history = [num]
  result = num

  while result != 1
    if (result % 2).zero?
      result /= 2
    else
      result = (result * 3) + 1
    end

    history.push(result)
  end

  history
end

(1..100).each { |n| puts "#{n} = #{collatz(n)}" }
