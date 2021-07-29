require_relative 'card'
class Deck
    CARDS = ["2","3","4","5","6","7","8","9","10","J","Q","K","A" ]
    SUITS = ["clubs", "spades", "heart", "diamonds"]

    attr_reader :deck_of_cards
    def initialize
        @deck_of_cards = []
        CARDS.each do |value|
            i = 3
            while i >= 0
                @deck_of_cards << Card.new(value, SUITS[i] )
                i -= 1
            end
        end
        @deck_of_cards.shuffle!
    end

    
end

# d = Deck.new
# p d.deck_of_cards