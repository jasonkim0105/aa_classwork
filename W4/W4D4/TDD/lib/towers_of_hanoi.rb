class Tower
    def initialize
        @tower_1 = [3,2,1]
        @tower_2 = []
        @tower_3 = []
    end

    def move(start_pos, end_pos)
        raise "raises error if the args are invalid" if
        !start_pos.is_a?(Integer)
        raise "raises error if the args are invalid" if
        !end_pos.is_a?(Integer)
        raise "raises error if the args are invalid" if
        start_pos < 1 || start_pos > 3 || end_pos < 1 || end_pos > 3

        case


    end

end