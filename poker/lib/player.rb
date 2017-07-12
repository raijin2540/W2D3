require_relative 'hand'

class Player
  attr_reader :name
  attr_accessor :hand, :bankroll

  def initialize(name, bankroll, hand = [])
    @name = name
    @bankroll = bankroll
    @hand = hand
  end


  def discard(*card_indices)
    card_indices.sort!.reverse!
    card_indices.each { |i| self.hand.cards.delete_at(i) }
    self.hand.cards
  end

  def fold
    self.hand = []
  end

  def see(bet)
    if bankroll > bet
      self.bankroll -= bet
      return bet
    end
    raise "Insufficient funds"

  end

  def raise!(bet)
    if bankroll > bet
      self.bankroll -= bet
      return bet
    end
    raise "Insufficient funds"

  end





  # need a method / way of tracking side pots if someone is all in
end
