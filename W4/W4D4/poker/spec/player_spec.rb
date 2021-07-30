require "player"

describe Player do

  subject(:player) {Player.new}
  describe "#initialize" do
    it "should initialize @pot to 100" do
      expect(player.pot).to eq(100)
    end
    it "it should initialize @hand with a hand instance" do
      expect(player.hand.is_a?(Hand)).to eq true
    end
  end

  describe "#askPlayer" do
    # it "should print 'Enter a command (hold, see, raise, discard): '" do 
    #   # allow(player.askPlayer).to receive(:gets).and_return("Enter a command (hold, see, raise, discard): \n")

    #   expect { player.askPlayer }.to output("Enter a command (hold, see, raise, discard): ").to_stdout
    # end

    it "should prompt user for guess and call gets.chomp to get input from the user " do
      input = double("fold\n", :chomp => "fold")
      allow(player).to receive(:gets).and_return(input)

      expect(input).to receive(:chomp)
      expect(player).to receive(:gets)
      player.askPlayer
    end

    it "should return 'hold' if player types hold" do
      input = double("hold\n", :chomp => "hold")
      allow(player).to receive(:gets).and_return(input)
      player.askPlayer
    end

    it "should return 'raise' if player types raise" do
      input = double("raise\n", :chomp => "raise")
      allow(player).to receive(:gets).and_return(input)
      player.askPlayer
    end

    it "should return 'see' if player types see" do
      input = double("see\n", :chomp => "see")
      allow(player).to receive(:gets).and_return(input)
      player.askPlayer
    end

    context "player chooses discard" do
      it " should prompt player to give up to 3 indexes to discard and returns an array" do
        input = double("[1,2,3]\n", :chomp => "[1,2,3]")
        allow(player).to receive(:gets).and_return(input)
        player.askPlayer
      end
    end




  end

end