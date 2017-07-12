class Deck
  attr_reader :cards

  def initialize
    @cards = Card.populate_poker_deck
  end

  def shuffle_deck!
    self.cards.shuffle!
  end

  def deal_card
    self.cards.pop
  end
end
