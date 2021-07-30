require_relative 'hand'

class Player

attr_reader :pot, :hand

  def initialize
    @pot = 100
    @hand = Hand.new
  end


  def askPlayer
    print "Enter a command (fold, see, raise, discard): "
    begin
      input = gets.chomp
      return 'fold' if input == 'fold'
      return 'see' if input == "see"
      return 'raise' if input == "raise"
      if input == "discard"
        discards = []
        count = 3
        3.times do
          puts "input index of card you want to discard, or input done if you're done"
          index = gets.chomp
          break if index == "done"
          discards << index.to_i
          count -= 1
          puts
          puts "you can discard #{count} more times"
          puts
        end
        return discards       
      end
      return
      raise "That's not a valid command"
    rescue
      puts "That's not a valid command, please try again"
      retry
    end
  end

end

# pe = Player.new(100)
# p pe.askPlayer