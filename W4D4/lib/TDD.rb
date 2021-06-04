def remove_dups(arr)
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end
    hash.keys
end

class Array
    def two_sum
        results = []

        (0...self.length - 1).each do |i|
            (0...self.length).each do |j|
                if j > i && self[i] + self[j] == 0
                    results << [i, j]
                end
            end
        end
        results
    end
end

def my_transpose(array)
    zipped = []

    (0...array.length).each do |i|
        temp = []
        array.each do |row|
            temp << row[i]
        end
        zipped << temp
    end
    zipped
end



def stock_picker(arr)
    max = 0
    max_pair = nil
    hash = {}

    arr.each.with_index do |num1, i1|
        arr.each.with_index do |num2, i2|
            if i1 < i2 
                hash[[i1, i2]] = num2 - num1
            end
        end
    end

    sorted = hash.sort_by {|k, v| v}
    sorted[-1][0]
end



class Towers_of_Hanoi

    attr_reader :towers, :number

    def initialize(number)
        @number = number
        @towers = Array.new(number) {Array.new}
        @towers[0] = (1..number).to_a
    end






end

