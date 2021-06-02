require_relative "PieceClass"


class Queen < Piece

    def symbol 
        if @color == :black
            "♛"
        else
            "♕"
        end
    end

end