require_relative 'deck'
require_relative 'player'

class Game
    attr_reader :player_1, :player_2, :player_3, :player_4, :deck, :players
    attr_accessor :pot, :current_player
    def initialize
        @player_1 = Player.new
        @player_2 = Player.new
        @player_3 = Player.new
        @player_4 = Player.new
        @players = [@player_1, @player_2, @player_3, @player_4]
        @deck = Deck.new
        @pot = 0
        @current_player = @player_1
    end

    def switch
        index = @players.index(current_player)
        new_index = (index + 1) % 5
        @current_player = @players[new_index]
    end

    
end