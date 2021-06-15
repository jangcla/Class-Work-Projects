require_relative "PieceClass"


class Pawn < Piece

    def symbol 
        if @color == :black
            "♟"
        else
            "♙"
        end
    end

end