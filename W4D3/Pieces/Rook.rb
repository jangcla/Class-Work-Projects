require_relative "PieceClass"


class Rook < Piece
    include Slideable

    def symbol 
        if @color == :black
            "♜"
        else
            "♖"
        end
    end

end