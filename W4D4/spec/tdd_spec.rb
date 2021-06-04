require "tdd"

describe "#remove_dups" do
    it "returns the unique elements in the order in which they appeared" do
        expect(remove_dups([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end
end

describe "Array" do
    describe "#two_sum" do
        it "finds all pairs of positions where the elements at those positions sum to zero." do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end

describe "my_transpose" do
    it "will convert between the row-oriented and column-oriented representations." do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end


describe "stock_picker" do
    it "outputs the most profitable pair of days" do 
        #stock picker has an array of [0,1,3,-1,4,-2,7] and index is the day that you bought the stock    
        expect(stock_picker([0,1,3,2,1,4,7])).to eq([0, 6])
    end

end


describe "Towers_of_Hanoi" do
    let(:tdd) {Towers_of_Hanoi.new(3)}

    describe "#initialize" do
        it "should accept a number as arguement" do 
           tdd
        end

        it "should create a 2D array with the range of 1 to num in the first array" do
            expect(Towers_of_Hanoi.new(3).towers).to eq([ [1,2,3], [], [] ])
        end
    end

    describe "#[]" do
        it "should accept an array containing a pair of indices in the form [row, column] representing a position"
    end



end