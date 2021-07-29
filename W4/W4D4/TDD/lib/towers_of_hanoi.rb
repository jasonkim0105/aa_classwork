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

        case start_pos
        when 1
            start_pos = @tower_1
        when 2
            start_pos = @tower_2
        when 3
            start_pos = @tower_3
        end

        case end_pos
        when 1
            end_pos = @tower_1
        when 2
            end_pos = @tower_2
        when 3
            end_pos = @tower_3
        end

        if start_pos.empty?
            raise "start is empty"
        elsif start_pos.last && end_pos.empty?
            end_pos << start_pos.pop
            return true
        elsif start_pos.last > end_pos.last
            return false
        elsif start_pos.last < end_pos.last
            end_pos << start_pos.pop
            return true
        end
    end

    def won
        return true if @tower_3 == [3,2,1]
        return false
    end

end