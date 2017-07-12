require 'player'
require 'deck'

class Game
  attr_reader :pot, :players, :current_player, :deck, :current_player_index
  def initialize(*players)
    @players = players
    @pot = 0
    @current_player = @player.first
    @deck = Deck.new
    @current_player_index = 0
  end

  def next_player!
    @current_player_index += 1
    @current_player = @players[@current_player_index]
  end


end
