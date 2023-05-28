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
    @opened = false
  end

  def set_karasa(karasa)
    raise unless karasa <= 1

    @karasa = karasa
  end

  def open_omake
    if !@opened
      puts 'Open omake!'
      @opened = true
    else
      puts 'mounaiyo!'
    end
  end
end

iguano = Curry.new(5)
# KodomoCurryはkarasaを2以上にするとエラー
# setgo = KodomoCurry.new(2, 200)
setgo = KodomoCurry.new(1, 200)

iguano.set_karasa(99)

puts 'iguano'
puts " karasa = #{iguano.karasa}"
puts " ryou = #{iguano.ryou}"

puts 'setgo'
puts " karasa = #{setgo.karasa}"
puts " ryou = #{setgo.ryou}"
setgo.open_omake
setgo.open_omake
