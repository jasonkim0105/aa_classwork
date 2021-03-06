require_relative "board.rb"
require_relative "card.rb"
class Game

  def initialize(size)
    @board = Board.new(size)

  end

  def guess
    puts "Enter coordinates with a space between the numbers"
    input_1 = gets.chomp.split(' ').to_i
    guess_1 = @board.reveal(input_1)
    @board.render
    # puts "Enter coordinates with a space between the numbers"
    # input_2 = gets.chomp.split(' ').to_i
    # guess_2 = @board.reveal(input_2)
  end

  def compare_guesses(guess_1, guess_2)
    first_guess = guess_1.guess
    second_guess = guess_2.guess
    if first_guess != second_guess
      first_guess.hide
      second_guess.hide
    end
  end

  def play(guess_1, guess_2)
    compare_guesses(guess_1, guess_2)
    if @board.won?
      print "Game over"
    end
  end

  #ask for a guess
  #flips the guess
  #ask for a second guess
  #flips second guess
  #compares the two guesses
    #if not matching flip the guesses back down
    #if they do match keep them flipped up
    #check if all cards are flipped up and if they are game over
  #after any flip have to render the board again


end