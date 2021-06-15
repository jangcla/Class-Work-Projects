require_relative "PieceClass"


class Knight < Piece

    def symbol 
        if @color == :black
            "♞"
        else
            "♘"
        end
    end

end