require 'pry'
require_relative 'deck'
class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def draw(deck)
    @cards << deck.cards.pop
  end

  def score
    best_score(possible_scores)
  end

  def bust?
    score > 21
  end

  def possible_scores
    aces, others = @cards.partition { |card| card.rank == "A" }
    sum = 0
    others.each do |card|
      sum += card.value
    end
    scores = [sum]
    aces.each do |ace|
      scores.map! do |score|
        score = score + 1
      end
      scores << scores.last + 10
    end
    scores
  end

  def best_score(scores)
    best_score = scores[0]
    scores.each do |score|
      if (score > best_score) && (score <= 21)
        best_score = score
      end
    end
    best_score
  end

end
