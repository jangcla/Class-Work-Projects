require 'singleton'
require_relative "PieceClass"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :none
    @symbol = ' '
     
  end

  # def moves  
    
  # end

  # def Symbol
    
  # end
end