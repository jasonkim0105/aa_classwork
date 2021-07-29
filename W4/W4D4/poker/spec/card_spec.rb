require 'card'

describe Card do
    subject(:card) {Card.new("5", "heart")}
    describe "#initialize" do
        it "should take in a value and a suit and set it to instance variables" do
            expect(card.value).to eq("5")
            expect(card.suit).to eq("heart")
        end

        it "should instantiate a instance variable @hidden to true" do
            expect(card.hidden).to eq true
        end
    end

    describe "#flip" do
        it "should correctly change hidden value to the opposite" do
            expect(card.flip).to eq false
            expect(card.flip).to eq true
        end
    end
end