require_relative "PieceClass"


class Pawn < Piece

    def initialize(color, board, pos)
        super(color, board,pos)

    end


    def symbol 
        if @color == :black
            "♟"
        else
            "♙"
        end
    end

end