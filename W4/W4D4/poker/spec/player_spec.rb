require "player"

describe Player do

  subject(:player) {Player.new(100)}
  describe "#initialize" do
    it "it should take in pot parameter that is the amount of money the player plays with. This should be set as a pot instance variable" do
      expect(player.pot).to eq (100)
    end
    it "it should initialize @hand with a hand instance" do
      expect(player.hand.is_a?(Hand)).to eq true
    end
  end

  describe "#askPlayer" do

  end

end