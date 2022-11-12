# frozen_string_literal: true

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
    create_player_symbols
  end

  def create_players
    @player1 = create_player(1, 'white')
    @player2 = create_player(2, 'black')
  end

  def create_player(num, symbol)
    player_name = player_name_input(num)
    Player.new(player_name, symbol)
  end
end
