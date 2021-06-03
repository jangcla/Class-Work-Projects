require_relative "PieceClass"


class Queen < Piece
    include Slideable

    def symbol 
        if @color == :black
            "♛"
        else
            "♕"
        end
    end

end