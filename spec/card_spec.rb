require 'spec_helper'

RSpec.describe Card do

  describe ".new" do
    it 'takes a suit and a rank as an argument' do
      card = Card.new('♦', '5')
      expect(card).to be_a(Card)
    end
  end

  let(:card) { Card.new('♦', '5') }
  let(:face_card) { Card.new('♦', 'K') }
  let(:ace) { Card.new('♦', 'A') }

  describe "#face_card?" do
    it 'returns false for a non-face-card' do
      expect(card.face_card?).to be(false)
    end
    it 'returns true for a face-card' do
      expect(face_card.face_card?).to be(true)
    end
  end

  describe "#ace?" do
    it 'returns true for an ace' do
      expect(ace.ace?).to be(true)
    end
    it 'returns false for a non-ace' do
      expect(card.ace?).to be(false)
    end
  end

  describe "#value" do
    it 'returns the rank as an integer for non-ace or face-card' do
      expect(card.value).to eq(5)
    end
    it 'returns 10 for a face-card' do
      expect(face_card.value).to eq(10)
    end
    it 'returns an array of [1, 11] for an ace' do
      expect(ace.value).to eq([1, 11])
    end
  end

  describe "#summary" do
    it 'returns the suit and rank of a card' do
      expect(card.summary).to eq("5 of ♦")
    end
  end

end
