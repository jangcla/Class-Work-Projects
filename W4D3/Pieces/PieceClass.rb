
class Piece

  def initialize(color, board, pos)
  
    @color = color
    @board = board
    @pos = pos
 
    #add piece to a part of the board
  end

  def to_s
    
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
    raise NotImplementedError
  end
  
  # private
  def move_into_check?(end_pos)
  end
end