# frozen_string_literal: true

t1 = Time.local(2019, 7, 18)
t2 = Time.now

puts (t2.to_i - t1.to_i) / (60 * 60 * 24)
