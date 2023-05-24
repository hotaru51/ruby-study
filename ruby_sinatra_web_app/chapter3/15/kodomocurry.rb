# frozen_string_literal: true

# Curry class
class Curry
  attr_reader :karasa, :ryou

  def initialize(karasa = 3, ryou = 300)
    set_karasa(karasa)
    set_ryou(ryou)
  end

  def set_karasa(karasa)
    @karasa = karasa
  end

  def set_ryou(ryou)
    @ryou = ryou
  end
end

# KodomoCurry class
class KodomoCurry < Curry
  def initialize(karasa = 1, ryou = 200)
    set_karasa(karasa)
    set_ryou(ryou)
  end

  def set_karasa(karasa)
    raise unless karasa <= 1

    @karasa = karasa
  end

  def open_omake
    puts 'Open omake!'
  end
end

iguano = Curry.new(5)
setgo = KodomoCurry.new

iguano.set_karasa(99)

puts 'iguano'
puts " karasa = #{iguano.karasa}"
puts " ryou = #{iguano.ryou}"

puts 'setgo'
puts " karasa = #{setgo.karasa}"
puts " ryou = #{setgo.ryou}"
setgo.open_omake
