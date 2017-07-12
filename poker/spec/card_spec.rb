require 'card'

describe Card do
  subject(:card) { Card.new(:hearts, 12)}
  let(:card2) { Card.new(:spades, 5) }

  describe "#initialize" do
    it "should have a suit" do
      expect(card.suit).to eq(:hearts)
      expect(card2.suit).to eq(:spades)
    end

    it "should have a value" do
      expect(card.value).to eq(12)
      expect(card2.value).to eq(5)
    end
  end
end
