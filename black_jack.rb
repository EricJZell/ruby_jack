require_relative 'hand'
require 'pry'
class BlackJack
  attr_reader :deck, :player_hand, :dealer_hand
  def initialize
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
    puts "The dealer is showing #{@dealer_hand.cards.last.summary}"
    player_turn
  end

  def player_turn
    puts player_situation
    puts "Hit? [y/n]"
    input = gets.chomp
    if input.upcase == 'Y'
      player_hit
    else
      dealer_turn
    end
  end

  def player_situation
    puts "You Have:"
    @player_hand.cards.each do |card|
      puts card.summary
    end
    situation = "Your score is: #{@player_hand.score}"
  end

  def player_hit
    @player_hand.draw(@deck)
    puts "You drew a #{@player_hand.cards.last.summary}"
    if @player_hand.bust?
      finish
    else
      player_turn
    end
  end

  def dealer_turn
    puts dealer_situation
    if @dealer_hand.score < 17
      puts "Dealer must hit..."
      dealer_hit
    else
      puts "The Dealer must stay..."
      finish
    end
  end

  def dealer_situation
    puts "The Dealer Has:"
    @dealer_hand.cards.each do |card|
      puts card.summary
    end
    situation = "Dealer score is: #{@dealer_hand.score}"
  end

  def dealer_hit
    @dealer_hand.draw(@deck)
    puts "Dealer drew a #{@dealer_hand.cards.last.summary}"
    if @dealer_hand.bust?
      finish
    else
      dealer_turn
    end
  end

  def finish
    puts "The game is over, here is a recap:"
    puts "Your score was #{@player_hand.score}"
    puts "The Dealer's score was #{@dealer_hand.score}"
    puts winner
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
game = BlackJack.new
