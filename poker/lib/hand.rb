require 'card'

class Hand
  attr_reader :cards

  def initialize(*cards)
    @cards = cards
  end

  def value
    if self.royal_flush?
      10
    elsif self.straight_flush?
      9
    elsif self.four_kind?
      8
    elsif self.full_house?
      7
    elsif self.flush?
      6
    elsif self.straight?
      5
    elsif self.three_kind?
      4
    elsif self.two_pair?
      3
    elsif self.pair?
      2
    else
      1
    end
  end

  def compare_hand(other_hand)
    compare = self.value <=> other_hand.value
    case compare
    when -1
      other_hand
    when 0 # deal with this case later
      nil
    when 1
      self
    end
  end

  # private
  def royal_flush?
    values = []
    self.cards.each { |card| values << card.value}
    values.sort!

    values == [10, 11, 12, 13, 14] && self.straight_flush?
  end

  def straight_flush?
    self.flush? && self.straight?
  end

  def full_house?
    values = []
    self.cards.each { |card| values << card.value}
    values.uniq.size == 2
  end

  def flush?
    suit = self.cards[0].suit
    self.cards.all? { |card| card.suit == suit }
  end

  def straight?
    values = []
    self.cards.each { |card| values << card.value}
    values.sort!
    return true if values == [2, 3, 4, 5, 14]

    i = 1
    while i < values.length
      return false if values[i] != values[i - 1] + 1
      i += 1
    end

    true
  end

  def four_kind?
    values = []
    self.cards.each { |card| values << card.value}

    values.uniq.each do |val|
      count = values.count(val)
      return true if count == 4
    end

    false
  end

  def three_kind?
    values = []
    self.cards.each { |card| values << card.value}

    values.uniq.each do |val|
      count = values.count(val)
      return true if count == 3
    end

    false
  end

  def two_pair?
    values = []
    self.cards.each { |card| values << card.value}
    values.uniq.size == 3
  end

  def pair?
    values = []
    self.cards.each { |card| values << card.value}
    values.uniq.size == 4
  end



end
