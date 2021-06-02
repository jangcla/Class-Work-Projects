require_relative "PieceClass"


class Bishop < Piece

    def symbol 
        if @color == :black
            "♝"
        else
            "♗"
        end
    end

end