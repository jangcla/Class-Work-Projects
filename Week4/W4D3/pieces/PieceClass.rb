
class Piece

  attr_reader :color

  def initialize(color, board, pos)
  
    @color = color
    @board = board
    @pos = pos
 
    #add piece to a part of the board
  end

  def moves 
    #should return array of valid moves

  end

  def to_s

  end

  def empty?
  end

  def valid_moves
    #should check if move is valid?
    
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