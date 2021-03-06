class Card

attr_reader :face_value

  def initialize(face_value)
    @face_value = face_value
    @face_down = true
  end

  def hide #turns face_down into true
    @face_down = true
  end

  def reveal #flips the card, turns the face_down value into false
    @face_down = false
  end

  def to_s #if face_down is true return " " else return face_value
    if @face_down == true
      return ' '
    else
      return @face_value
    end
  end

  def ==(card2) #compare two cards to see they are the same and return true if so
    self.face_value == card2.face_value
  end

  # def hide
  #   if !self.up_or_down
  # end



end