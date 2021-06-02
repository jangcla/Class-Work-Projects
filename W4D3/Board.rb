require_relative "PieceClass"

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    @null_piece = NullPiece.new
    



    
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @rows[row][col]
  end

  def []=(pos, piece)
    row = pos[0]
    col = pos[1]
    @rows[row][col] = piece
  end

  def move_piece(color, start_pos, end_pos)
    # unless start_pos is null_piece && is within the board and
    # unless end_pos is a valid move (any position that doesn't have your own piece & within board)
      # raise exception
  end

  def valid_pos?(pos)
    if self[pos] == null_piece && 
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

 

end