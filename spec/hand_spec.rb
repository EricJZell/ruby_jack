require 'spec_helper'

RSpec.describe Hand do

  describe ".new" do
    it 'creates and empty new hand' do
      hand = Hand.new
      expect(hand.cards).to eq([])
    end
  end

  let(:deck) { Deck.new }
  let(:hand) { Hand.new }
  let(:ace) { Card.new('♠', 'A')}
  let(:face_card) { Card.new('♠', 'K')}
  let(:card1) { Card.new('♠', '7')}
  let(:card2) { Card.new('♠', '3')}

  describe "#draw" do
    it "adds a card to the hand" do
      hand.draw(deck)
      expect(hand.cards[0]).to be_a(Card)
    end
    it "removes a card from the deck" do
      hand.draw(deck)
      expect(deck.cards.include?(hand.cards[0])).to be(false)
    end
  end

  describe "#possible_scores" do
    it 'returns one possible score with no aces' do
      hand.cards << card1 << card2
      expect(hand.possible_scores).to eq([10])
    end
    it 'returns two possible scores with 1 ace' do
      hand.cards << card1 << card2 << ace
      expect(hand.possible_scores).to match_array([11, 21])
    end
    it 'returns three possible scores with 2 aces' do
      hand.cards << card1 << card2 << ace << ace
      expect(hand.possible_scores).to match_array([12, 22, 32])
    end
    it 'returns four possible scores with 3 aces' do
      hand.cards << ace << ace << ace
      expect(hand.possible_scores).to match_array([3, 13, 23, 33])
    end
    it 'returns five possible scores with 4 aces' do
      hand.cards << ace << ace << ace << ace
      expect(hand.possible_scores).to match_array([4, 14, 24, 34, 44])
    end
  end

  describe "#best_score" do
    it 'picks the highest score less than or equal to 21' do
      expect(hand.best_score([3, 13, 23])).to eq(13)
      expect(hand.best_score([20, 21, 22])).to eq(21)
    end
  end

  describe "#score" do
    it 'calculates the possible scores and returns the best one' do
      hand.cards << card1 << ace
      expect(hand.score).to eq(18)
      hand.cards << card2
      expect(hand.score).to eq(21)
      hand.cards << ace
      expect(hand.score).to eq(12)
    end
  end

  describe "#bust" do
    it 'returns false if 21 or under' do
      hand.cards << card1 << card2 << ace
      expect(hand.bust?).to be(false)
      hand.cards << card1 << card1
      expect(hand.bust?).to be (true)
    end
  end

end
