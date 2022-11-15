# frozen_string_literal: true

require_relative 'input'
require_relative 'display'
require_relative 'player'

# Class for the game itself. Central connector of all other classes
class Game
  include Input
  include Display
  attr_reader :cage, :player1, :player2, :current_player

  def initialize
    @cage           = nil
    @player1        = nil
    @player2        = nil
    @current_player = nil
  end

  def play
    create_players
    create_cage
    cage.display
  end

  def create_players
    @player1 = create_player(1, "\u26AA")
    @player2 = create_player(2, "\u26AB")
  end

  def create_player(num, symbol)
    player_name = player_name_input(num)
    Player.new(player_name, symbol)
  end

  def create_cage
    cage_size = cage_size_input
    @cage = Cage.new((cage_size))
  end
end
