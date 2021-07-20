class Card

attr_reader :face_value

  def initialize(face_value, face_up, face_down)
    @face_value = face_value
    @face_up = face_up
    @face_down = face_down
    @face_up_down = @face_up
  end

  def hide
    if @face_up_down == @face_up
      true
    else
      false
    end
  end

  def reveal 
    if self.up_or_down 
      @face_value
    end
  end
      

  # def hide
  #   if !self.up_or_down
  # end



end