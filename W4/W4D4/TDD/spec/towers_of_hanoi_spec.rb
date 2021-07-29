require "towers_of_hanoi"

describe Tower do
    subject(:tower) {Tower.new}
    describe "#initialize" do
        it "expects @tower_1 to be stack of 3 in decreasing order, @tower_2 and @tower_3 to be empty" do
            expect(tower.instance_variable_get("@tower_1")).to eq([3,2,1])
            expect(tower.instance_variable_get("@tower_2")).to eq([])
            expect(tower.instance_variable_get("@tower_3")).to eq([])
        end
    end

    describe "#move" do
        describe "takes two parameters, one for the starting stack and one for the ending stack" do
            context "with_invalid_args" do
                it "raises error if the args are invalid" do
                    expect{tower.move(1)}.to raise_error(ArgumentError)

                    expect{tower.move("a",0)}.to raise_error("raises error if the args are invalid")

                    expect{tower.move(0,"b")}.to raise_error("raises error if the args are invalid")

                    expect{tower.move(-1, 0)}.to raise_error("raises error if the args are invalid")

                    expect{tower.move(4,0)}.to raise_error("raises error if the args are invalid" )
                    expect{tower.move(1,5)}.to raise_error("raises error if the args are invalid")
                    expect{tower.move(0,-4)}.to raise_error("raises error if the args are invalid")
                end
            end
            context "with valid args" do
                it "it should return false if top ring's value at end_pos stack is lower than top ring's value at start_pos" do
                    tower.move(1,2)
                    expect(tower.move(1,2)).to eq false


                end
                it "if the end_pos is empty or end_pos's value is greater than start_pos value, then move start_pos into end_pos and return true" do
                    tower.move(1,2)
                    expect(tower.move(1,3)).to eq true
                    expect(tower.move(2,3)).to eq true
                    expect(tower.instance_variable_get("@tower_3")).to eq [2,1]
                end
            end
        end
    end

    describe "#won" do
        it "return true if all rings are on the last stack" do
            tower.move(1,3)
            tower.move(1,2)
            tower.move(3,2)
            tower.move(1,3)
            tower.move(2,1)
            tower.move(2,3)
            tower.move(1,3)
            expect(tower.won).to eq true
        end

        it "return false if all rings are not on the last stack" do
            expect(tower.won).to eq false
        end
    end


end