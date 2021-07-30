require 'game'

describe Game do
    subject(:game){Game.new}
    describe "#initialize" do
        it "should create four players to their own instance variables" do
            expect(game.player_1.is_a?(Player)).to eq true
            expect(game.player_2.is_a?(Player)).to eq true
            expect(game.player_3.is_a?(Player)).to eq true
            expect(game.player_4.is_a?(Player)).to eq true
        end

        it "should put all players in @players array" do
            expect(game.players).to eq([game.player_1, game.player_2, game.player_3, game.player_4])
        end

        it "should save a deck instance to an instance variable " do
            expect(game.deck.is_a?(Deck)).to eq true
        end

        it "should set @pot to 0" do
            expect(game.pot).to eq(0)
        end

        it "should set @current_player to @player_1" do
            expect(game.current_player).to eq(game.player_1)
        end
    end

    describe "#switch" do
        it "should switch player to the next player in @players array" do
            expect(game.switch).to eq(game.player_2)
        end
    end

    
end