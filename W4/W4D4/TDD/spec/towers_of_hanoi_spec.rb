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
        context "with_invalid_args" do
            it "raises error if the args are invalid"



            it "takes two parameters, one for the starting stack and one for the ending stack" do
                expect(tower.move).to 
            end
            
        end

    end


end