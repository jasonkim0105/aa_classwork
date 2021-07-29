require "tdd_exercises"

describe Array do

  describe "#my_uniq" do
    it "it removes duplicates from an array and returns the unique elements in the order in which they first appeared in." do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "Writes a new Array#two_sum method that finds all pairs of positions in order where the elements at those positions sum to zero." do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "it will convert between the row-oriented and column-oriented representations." do
      rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
    #  row_0 = rows[0].dup
    #  row_1 = rows[1].dup
    #  row_2 = rows[2].dup
    #   new_rows = rows.my_transpose
      expect(rows.my_transpose).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ])
    end
  end

  describe "#stock_picker" do
    it "takes an array of stock prices and returns the pair of days with the most profit made total" do
      expect([5, 6, 7, 8, 9, 10, 5].stock_picker).to eq([0,5])
    end
  end


end