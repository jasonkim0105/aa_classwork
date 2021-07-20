class Board

  attr_reader :grid

  def initialize(size)
    @size = 4
    @grid = Array.new(size) {Array.new(size)}

  end

  def make_cards #should return an array of all the cards, shuffled
    cards = []
    values = ("A".."Z").to_a.sample(8)
    values.each do |ele|
      one = Card.new(ele)
      cards << one
      cards << one
    end


    cards
  end

  def populate # should place each card on a space on the grid
    i = 0
    j = 0
    while j < 16
        card = Card.new()
        while i < 2
            row = rand(0...grid.length)
            col = rand(0...grid.length)
            @grid[row][col] = card
            i += 1
        end
        j += 1
    end
  end

end