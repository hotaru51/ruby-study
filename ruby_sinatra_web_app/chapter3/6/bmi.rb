# frozen_string_literal: true

def calc_bmi(tall, weight)
  (weight / (tall**2)).truncate(1)
end

tall = 1.58
weight = 42.0

bmi = calc_bmi(tall, weight)
puts "bmi = #{bmi}"

case calc_bmi(tall, weight)
when 0.0..18.4
  puts '18.5 未満・・・低体重'
when 18.5..24.9
  puts '18.5 以上 25.0 未満・・・標準体重'
when 25.0..29.9
  puts '25.0 以上 30.0 未満・・・肥満 (1度)'
when 30.0..34.9
  puts '30.0 以上 35.0 未満・・・肥満 (2度)'
when 35.5..39.9
  puts '35.0 以上 40.0 未満・・・肥満 (3度)'
else
  puts '40.0 以上・・・肥満 (4度)'
end
