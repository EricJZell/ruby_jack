require_relative 'hand'
require 'pry'
class BlackJack
  attr_reader :deck, :player_hand, :dealer_hand, :finished
  def initialize
    @finished = false
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    deal
  end

  def deal
    2.times do
      @player_hand.draw(@deck)
      @dealer_hand.draw(@deck)
    end
    if @player_hand.score == 21 || @dealer_hand.score == 21
      @finished = true
    end
  end

  def player_turn(decision)
    if decision == "Hit"
      player_hit
    else
      dealer_turn
    end
  end

  def player_hit
    @player_hand.draw(@deck)
    if @player_hand.bust?
      @finished = true
    end
  end

  def dealer_turn
    if @dealer_hand.score < 17
      dealer_hit
    else
      @finished = true
    end
  end

  def dealer_hit
    @dealer_hand.draw(@deck)
    if @dealer_hand.bust?
      @finished = true
    else
      dealer_turn
    end
  end

  def winner
    if @player_hand.bust?
      "You bust, you lose!"
    elsif @dealer_hand.bust?
      "Dealer bust, you win!"
    elsif @dealer_hand.score > @player_hand.score
      "Dealer wins!"
    elsif @player_hand.score > @dealer_hand.score
      "You win!"
    else
      "It's a tie!"
    end
  end
end
