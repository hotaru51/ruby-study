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
  if valid_date?(params[:y], params[:m])
    @year = params[:y].to_i
    @month = params[:m].to_i
  else
    now = Time.now
    redirect "/#{now.year}/#{now.month}"
  end

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

  @next_year = @year
  @next_month = @month + 1
  if @next_month >= 13
    @next_year += 1
    @next_month = 1
  end

  @prev_year = @year
  @prev_month = @month - 1
  if @prev_month <= 0
    @prev_year -= 1
    @prev_month = 12
  end

  erb :moncal
end

def day_tag(year, month, day)
  dow = zeller(year, month, day)
  d = day.to_s
  now = Time.now
  today = {
    year: now.year,
    month: now.month,
    day: now.day
  }

  d = "<b>[#{d}]</d>" if today[:year] == year && today[:month] == month && today[:day] == day

  case dow
  when 0 then "<td align=\"right\"><font color=\"red\">#{d}</font></td>"
  when 6 then "<td align=\"right\"><font color=\"blue\">#{d}</font></td>"
  else "<td align=\"right\">#{d}</td>"
  end
end

def valid_date?(year, month)
  y = year.to_i
  m = month.to_i

  return false if y.negative?

  return false unless (1..12).include?(m)

  true
end
