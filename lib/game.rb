# frozen_string_literal: true

require_relative 'display'
require_relative 'input'
require_relative 'player'
require_relative 'cage'
require_relative 'game'

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
    puts display_user_name_prompt(player_num)
    player_name = player_name_input(num).capitalize
    Player.new(player_name, symbol)
  end

  def create_cage
    puts display_cage_size_prompt
    cage_size = cage_size_input.to_i
    @cage = Cage.new((cage_size))
  end
end
