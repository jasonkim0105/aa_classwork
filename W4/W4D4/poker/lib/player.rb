require "deck"

class Player

attr_reader :pot, :hand

  def initialize(pot)
    @pot = pot
    @hand = Hand.new
  end

end