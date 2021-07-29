class Card
    attr_reader :value, :suit, :hidden
    def initialize(value, suit)
        @value = value.to_s
        @suit = suit
        @hidden = true
    end

    def flip
        @hidden = !@hidden
    end

    def inspect
        self.value
    end
end