require "require_all"
require_all "pieces"

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    
    (2..5).each do |i|
      (0..7).each do |j|
        @rows[i][j] = NullPiece.instance.symbol
      end
    end

    (0..7).each do |i|
        @rows[1][i] = Pawn.new(:white, @rows, [1, i]).symbol
        @rows[6][i] = Pawn.new(:black, @rows, [6, i]).symbol
    end

    [0, 7].each do |i|
      @rows[0][i] = Rook.new(:white, @rows, [0, i]).symbol
      @rows[7][i] = Rook.new(:black, @rows, [7, i]).symbol    
    end

    [1, 6].each do |i|
      @rows[0][i] = Knight.new(:white, @rows, [0, i]).symbol
      @rows[7][i] = Knight.new(:black, @rows, [7, i]).symbol
    end

    [2, 5].each do |i|
      @rows[0][i] = Bishop.new(:white, @rows, [0, i]).symbol
      @rows[7][i] = Bishop.new(:black, @rows, [7, i]).symbol
    end

    [3, 4].each do |i|
      if i == 3
        @rows[0][i] = King.new(:white, @rows, [0, i]).symbol
        @rows[7][i] = King.new(:black, @rows, [7, i]).symbol
      else
        @rows[0][i] = Queen.new(:white, @rows, [0, i]).symbol
        @rows[7][i] = Queen.new(:black, @rows, [7, i]).symbol
      end
    end
    
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
    # if self[pos] == null_piece  
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