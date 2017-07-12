require 'game'

describe Game do

  subject(:game) { Game.new(Player.new("Jonathan", 100), Player.new("Jin", 100), Player.new("Tommy"), 100) }
  let(:better) { double("Betting Player") }

  describe "#initialize" do
    it "creates a new deck" do
      expect(game.deck.cards.count).to eq(52)
    end
  end

  describe "#current_player" do
    it "keeps track of current player" do
      expect(game.current_player.name).to be("Jonathan")
    end
  end

  describe "#next_player!" do
    it "should change the current player to the next player in the list" do
      expect(game.current_player.name).to eq("Jonathan")
      game.next_player!
      expect(game.current_player.name).to eq("Jin")
      game.next_player!
      expect(game.current_player.name).to eq("Tommy")
      game.next_player!
      expect(game.current_player.name).to eq("Jonathan")
    end
  end

  describe "#pot" do
    it "returns the current pot amount" do
      expect(game.pot).to eq(0)
    end
  end

  describe "#add_to_pot" do
    it "should receive a bet from a player" do
      allow(better).should_receive(:bet).and_return(10)
      expect(better.bet(10)).to eq(game.pot + 10)
    end
  end




end
