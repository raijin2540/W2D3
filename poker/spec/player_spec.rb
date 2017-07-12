require 'player'

describe Player do
  subject(:player) { Player.new("Jin", 100, Hand.new(Card.new(:clubs, 4), Card.new(:hearts, 4),Card.new(:diamonds, 10), Card.new(:spades, 10), Card.new(:clubs, 14)))}
  let(:game) { double("Test Game", bet: 10) }

  describe "#initialize" do
    it "should set a bankroll for the player" do
      expect(player.bankroll).to eq(100)
    end

    it "should create a hand" do
      expect(player.hand).to be_an_instance_of(Hand)
    end
  end

  describe "#discard" do
    it "should discard 1 card" do
      old_hand = player.hand.dup
      expect(old_hand.cards[0..1] + old_hand.cards[3..4]).to eq(player.discard(2))
    end

    it "should discard 2 cards" do
      old_hand = player.hand.dup
      expect(old_hand.cards[2..4]).to eq(player.discard(0, 1))
    end

    it "should discard 3 cards" do
      old_hand = player.hand.dup
      expect([old_hand.cards[0], old_hand.cards[2]]).to eq(player.discard(1, 3, 4))
    end
  end

  describe "#fold" do
    it "should delete the player's hand" do
      player.fold
      expect(player.hand).to eq([])
    end
  end

  describe "#see" do
    it "should return the bet amount" do
      expect(player.see(game.bet)).to eq(10)
    end

    it "should call the current bet and deduct the amount from player's bankroll" do
      player.see(game.bet)
      expect(player.bankroll).to eq(90)
    end
  end

  describe "#raise!" do
    it "should return the bet amount" do
      expect(player.raise!(25)).to eq(25)
    end

    it "should deduct the amount raised from player's bankroll" do
      player.raise!(25)
      expect(player.bankroll).to eq(75)
    end

    # it "should raise an error if argument <= current bet" do
    #   expect { player.raise!(10) }.to raise_error(ArgumentError, "You can't raise an amount that's not greater than the current bet")
    # end
  end
end
