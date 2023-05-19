# frozen_string_literal: true

require 'date'

t1 = Time.local(2023, 4, 17)
t2 = Time.local(2023, 8, 1)

puts (t2.to_i - t1.to_i) / (60 * 60 * 24)
