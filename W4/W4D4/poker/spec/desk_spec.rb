require 'deck'

describe Deck do
    subject(:deck){Deck.new}
    describe "#initialize" do
        it "create and array of 52 different cards" do
            expect(deck.deck_of_cards.length).to eq(52)
            expect(deck.deck_of_cards.uniq.length).to eq(52)
        end
    end

end