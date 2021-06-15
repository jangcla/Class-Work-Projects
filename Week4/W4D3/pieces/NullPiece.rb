require 'singleton'
require_relative "PieceClass"

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @color = :none
    @symbol = nil
     
  end

  # def moves  
    
  # end

end