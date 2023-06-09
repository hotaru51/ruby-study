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

get '/' do
  now = Time.now
  redirect "/#{now.year}/#{now.month}"
end

get '/:y/:m' do
  @year = params[:y].to_i
  @month = params[:m].to_i

  @cal_table = '<table border>'
  @cal_table += '<tr><th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th></tr>'

  ld = last_day(@year, @month)
  w = zeller(@year, @month, 1)

  day = 1
  6.times do |p|
    @cal_table += '<tr>'

    7.times do |q|
      if p.zero? && q < w
        @cal_table += '<td></td>'
      else
        if day <= ld
          @cal_table += day_tag(@year, @month, day)
          day += 1
        else
          @cal_table += '<td></td>'
        end
      end
    end

    @cal_table += '</tr>'

    if day > ld
      break
    end
  end

  @cal_table += '</table>'

  erb :moncal
end

def day_tag(year, month, day)
  dow = zeller(year, month, day)
  case dow
  when 0 then "<td align=\"right\"><font color=\"red\">#{day}</font></td>"
  when 6 then "<td align=\"right\"><font color=\"blue\">#{day}</font></td>"
  else "<td align=\"right\">#{day}</td>"
  end
end
