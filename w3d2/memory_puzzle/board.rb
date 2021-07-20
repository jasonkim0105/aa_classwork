class Board

  attr_reader :grid

  def initialize()
    @grid = Array.new(4) {Array.new(4)}

  end

  def populate(*card)
    i = 0
    card = Card.new()
    while i < 8
      row = rand(0...grid.length)
      col = rand(0...grid.length)
      i += 1
    end
  end

end