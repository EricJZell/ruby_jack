require 'spec_helper'

RSpec.describe Deck do

  let(:deck) { Deck.new }

  describe ".new" do
    it 'creates 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
    it 'has 13 of each suit' do
      spades = deck.cards.select { |card| card.suit == "♠" }
      expect(spades.length).to eq(13)
      clubs = deck.cards.select { |card| card.suit == "♣" }
      expect(clubs.length).to eq(13)
      diamonds = deck.cards.select { |card| card.suit == "♦" }
      expect(diamonds.length).to eq(13)
      hearts = deck.cards.select { |card| card.suit == "♥" }
      expect(hearts.length).to eq(13)
    end
    it 'is shuffled' do
      card1 = deck.cards.select { |card| card.suit == '♥' && card.rank == '2' }[0]
      card2 = deck.cards.select { |card| card.suit == '♥' && card.rank == '3' }[0]
      card3 = deck.cards.select { |card| card.suit == '♥' && card.rank == '4' }[0]
      index1 = deck.cards.index(card1)
      index2 = deck.cards.index(card2)
      index3 = deck.cards.index(card3)
      expect((index1.next != index2) && (index2.next != index3)).to be(true)
    end
  end
end
