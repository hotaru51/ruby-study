# frozen_string_literal: true

# Curry class
class Curry
  attr_accessor :karasa, :ryou

  def initialize(karasa = 3, ryou = 300)
    @karasa = karasa
    @ryou = ryou
  end
end

# KodomoCurry class
class KodomoCurry < Curry
  def initialize(karasa = 1, ryou = 200)
    super(karasa, ryou)
  end

  def open_omake
    puts 'Open omake!'
  end
end

iguano = Curry.new(5)
setgo = KodomoCurry.new

iguano.karasa = 99

puts 'iguano'
puts " karasa = #{iguano.karasa}"
puts " ryou = #{iguano.ryou}"

puts 'setgo'
puts " karasa = #{setgo.karasa}"
puts " ryou = #{setgo.ryou}"
setgo.open_omake
