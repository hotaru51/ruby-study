# frozen_string_literal: true

a = Time.now
[
  a.zone,
  a.getutc,
  a.year,
  a.month,
  a.day,
  a.hour,
  a.min,
  a.sec,
  a.wday,
  a.yday,
  a.isdst,
  a.to_i
].each { |val| puts val }
