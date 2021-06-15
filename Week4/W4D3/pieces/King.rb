require_relative "PieceClass"


class King < Piece

    def symbol 
        if @color == :black
            "♚"
        else
            "♔"
        end
    end

end