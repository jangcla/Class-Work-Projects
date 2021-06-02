require_relative "PieceClass"


class Rook < Piece

    def symbol 
        if @color == :black
            "♜"
        else
            "♖"
        end
    end

end