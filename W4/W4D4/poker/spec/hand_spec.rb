require "hand"

describe Hand do
  subject(:hand) {Hand.new()}

  describe "#initialize" do
    it "it should initialize @your_hand, which should be an empty array" do
      expect(hand.your_hand).to eq([])
    end
  end

  describe "#addCard" do

    it "it should return false if @your_hand is full" do
      hand.addCard(2)
      hand.addCard(5)
      hand.addCard(2)
      hand.addCard(5)
      hand.addCard(2)
      expect(hand.addCard("test")).to eq false
    end
    it "it should return true if @your_hand is not full and add the passed in card to your_hand" do
      expect(hand.addCard("test")).to eq true
      expect(hand.your_hand.length).to eq (1)
    end
  end

  describe "#removeCard" do

    it "it should remove a card from @your_hand at a specific position" do
      hand.addCard(2)
      hand.addCard(5)
      expect(hand.removeCard(1)).to eq ([2])
    end
  end

end