require 'hand'

describe Hand do
  subject(:hand) { Hand.new(Card.new(:clubs, 4), Card.new(:hearts, 4),Card.new(:diamonds, 10), Card.new(:spades, 10), Card.new(:clubs, 14)) }
  describe "#initialize" do
    it "should create a hand with five cards" do
      expect(hand.cards.size).to eq(5)
    end
  end

  describe "#value" do
    it "should detect a royal flush" do
      winner = Hand.new(Card.new(:clubs, 13), Card.new(:clubs, 12),Card.new(:clubs, 11), Card.new(:clubs, 10), Card.new(:clubs, 14))
      expect(winner.value).to eq(10)
    end

    it "should detect a straight flush" do
      hand = Hand.new(Card.new(:clubs, 6), Card.new(:clubs, 2),Card.new(:clubs, 3), Card.new(:clubs, 4), Card.new(:clubs, 5))
      expect(hand.value).to eq(9)
    end

    it "should detect a 4 of a kind" do
      hand = Hand.new(Card.new(:clubs, 2), Card.new(:hearts, 2),Card.new(:diamonds, 2), Card.new(:clubs, 2), Card.new(:diamonds, 5))
      expect(hand.value).to eq(8)
    end

    it "should detect a full house" do
      hand = Hand.new(Card.new(:clubs, 4), Card.new(:hearts, 4),Card.new(:diamonds, 4), Card.new(:clubs, 5), Card.new(:diamonds, 5))
      expect(hand.value).to eq(7)
    end

    it "should detect a flush" do
      hand = Hand.new(Card.new(:diamonds, 2), Card.new(:diamonds, 4),Card.new(:diamonds, 8), Card.new(:diamonds, 5), Card.new(:diamonds, 11))
      expect(hand.value).to eq(6)
    end

    it "should detect a straight" do
      hand = Hand.new(Card.new(:clubs, 6), Card.new(:hearts, 2),Card.new(:spades, 3), Card.new(:diamonds, 4), Card.new(:clubs, 5))
      expect(hand.value).to eq(5)
    end

    it "should detect a 3 of a kind" do
      hand = Hand.new(Card.new(:clubs, 2), Card.new(:hearts, 2),Card.new(:diamonds, 2), Card.new(:clubs, 3), Card.new(:diamonds, 5))
      expect(hand.value).to eq(4)
    end

    it "should detect a 2 pair" do
      hand = Hand.new(Card.new(:clubs, 4), Card.new(:hearts, 4),Card.new(:diamonds, 6), Card.new(:clubs, 6), Card.new(:diamonds, 5))
      expect(hand.value).to eq(3)
    end

    it "should detect a pair" do
      hand = Hand.new(Card.new(:hearts, 4), Card.new(:diamonds, 4),Card.new(:clubs, 8), Card.new(:diamonds, 5), Card.new(:diamonds, 11))
      expect(hand.value).to eq(2)
    end

    it "should detect a high card" do
      hand = Hand.new(Card.new(:clubs, 14), Card.new(:hearts, 2),Card.new(:spades, 10), Card.new(:diamonds, 4), Card.new(:clubs, 11))
      expect(hand.value).to eq(1)
    end
  end

  describe "#compare_hand" do
    it "should return higher ranking hand" do
      royal_flush = Hand.new(Card.new(:clubs, 13), Card.new(:clubs, 12),Card.new(:clubs, 11), Card.new(:clubs, 10), Card.new(:clubs, 14))
      straight = Hand.new(Card.new(:clubs, 6), Card.new(:hearts, 2),Card.new(:spades, 3), Card.new(:diamonds, 4), Card.new(:clubs, 5))
      expect(royal_flush.compare_hand(straight)).to eq(royal_flush)
      two_pair = Hand.new(Card.new(:clubs, 4), Card.new(:hearts, 4),Card.new(:diamonds, 6), Card.new(:clubs, 6), Card.new(:diamonds, 5))
      high_card = Hand.new(Card.new(:clubs, 14), Card.new(:hearts, 2),Card.new(:spades, 10), Card.new(:diamonds, 4), Card.new(:clubs, 11))
      expect(high_card.compare_hand(two_pair)).to eq(two_pair)
    end
  end
end
