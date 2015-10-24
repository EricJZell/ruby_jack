require_relative 'card'
require 'pry'

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    suits = ["♠", "♥", "♦", "♣"]
    values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits.each do |suit|
      values.each do |value|
        @cards << Card.new(suit, value)
      end
    end
    @cards.shuffle!
  end
end
