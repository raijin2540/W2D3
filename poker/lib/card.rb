class Card
  attr_reader :suit, :value

  CARD_VALUES = (2..14).to_a
  SUITS = [:hearts, :clubs, :diamonds, :spades]

  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  #
  def self.populate_poker_deck
    new_deck = []
    CARD_VALUES.each do |value|
      SUITS.each do |suit|
        new_deck << self.new(suit, value)
      end
    end

    new_deck.shuffle!
  end

end
