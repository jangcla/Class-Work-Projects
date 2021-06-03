require_relative "PieceClass"


class Bishop < Piece
    include Slideable

    def symbol 
        if @color == :black
            "♝"
        else
            "♗"
        end
    end

end