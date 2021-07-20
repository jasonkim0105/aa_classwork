require_relative "board.rb"

class Game

  def initialize(size)
    @board = Board.new(size)

  end

  def guess
    puts "Enter coordinates with a space between the numbers"
    input = gets.chomp.split(' ').to_i
  end
end