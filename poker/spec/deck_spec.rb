require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "should create an array with 52 cards" do
      expect(deck.cards.size).to eq(52)
    end

    it "should have 52 unique cards" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe "#shuffle_deck!" do
    it "should shuffle the deck" do
      old_deck = deck.cards.dup
      expect(old_deck).not_to eq(deck.shuffle_deck!)
    end
  end

  describe "#deal_card" do
    it "should deal the top card" do
      expect(deck.deal_card).to be_an_instance_of(Card)
      expect(deck.cards.size).to eq(51)
    end
  end




end
