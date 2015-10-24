require 'pry'

class Card
  attr_reader :suit, :rank
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def face_card?
    ['J', 'Q', 'K'].include?(@rank)
  end

  def ace?
    @rank == 'A'
  end

  def value
    if face_card?
      10
    elsif ace?
      [1, 11]
    else
      @rank.to_i
    end
  end

  def summary
    "#{@rank} of #{@suit}"
  end
end
