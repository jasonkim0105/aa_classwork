# require_relative "deck"

class Hand

  attr_reader :your_hand

  def initialize
    @your_hand = []
  end

  def addCard(newCard)
    if @your_hand.length == 5
      return false
    else
      @your_hand << newCard
      return true
    end
  end

  def removeCard(pos)
    @your_hand = @your_hand[0...pos] + @your_hand[pos+1..-1]
  end

end