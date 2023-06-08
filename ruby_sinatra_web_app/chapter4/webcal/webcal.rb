# frozen_string_literal: true

require 'sinatra'

set :environment, :production

# 閏年判定
def leap_year?(year)
  (year % 4).zero? && !((year % 100).zero? && year % 400 != 0)
end

# 月の日数を返す
def last_day(year, month)
  days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  m = (month - 1) % 12
  days[m] = 29 if leap_year?(year)

  days[m]
end

# 指定した日付の曜日を返す
def zeller(year, month, day)
  y = year
  m = month
  d = day

  if m <= 2
    y -= 1
    m += 12
  end

  (y + (y / 4).floor - (y / 100).floor + (y / 400) + ((13 * m + 8) / 5).floor + d) % 7
end

get '/:y/:m' do
  @year = params[:y].to_i
  @month = params[:m].to_i

  puts "西暦 #{@year} 年 #{@month} 月"
  puts 'Sun Mon Tue Wed Thu Fir Sat'

  w = zeller(@year, @month, 1)
  c = 0
  while c < w
    print '    '
    c += 1
  end

  ld = last_day(@year, @month)

  (1..ld).each do |d|
    print format(' %2d ', d)
    c += 1
    print "\n" if (c % 7).zero?
  end

  print "\n"

  erb :moncal
end
