class Board

  attr_reader :grid

  def initialize(size = 4)
    @size = size
    @grid = Array.new(@size) {Array.new(@size)}
<<<<<<< HEAD

=======
>>>>>>> a902c49f5fe8c00465c804dd90bcb9cb4a01afeb
  end

  def make_cards #should return an array of all the cards, shuffled
    cards = []
    values = ("A".."Z").to_a.sample(8)
    values.each do |ele|
      one = Card.new(ele)
      two = Card.new(ele)
      cards << one
      cards << two
    end
    cards.sample(16)
  end

  def populate # should place each card on a space on the grid
    cards = make_cards
    (0...@size).each do |row|
      (0...@size).each do |col|
        cards.each do |ele|
          @grid[row][col] = ele
        end
        cards.delete_at(-1)
      end
    end
    return @grid
  end

  def render
    return @grid
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false if card.face_down == true
      end
    end
    return true
  end

  def reveal(guessed_pos)
    card = @grid[guessed_pos[0]][guessed_pos[1]]
    if card.face_down == true
      card.to_s
      return card.face_value
    end
  end

end

# p Board.populate
