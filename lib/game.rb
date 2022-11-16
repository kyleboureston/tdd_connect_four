# frozen_string_literal: true

require_relative 'colors'
require_relative 'display/messages'
require_relative 'input'
require_relative 'player'
require_relative 'cage'
require_relative 'game'

# Class for the game itself. Central connector of all other classes
class Game
  include Input
  include Display::Messages
  attr_reader :cage, :player1, :player2, :current_player

  def initialize
    @cage           = nil
    @player1        = nil
    @player2        = nil
    @current_player = nil
    @colors         = ['red', 'green', 'yellow', 'purple', 'pink', 'blue', 'white']
  end

  def play
    create_players
    create_cage
    cage.display
    @current_player = @player1
    play_turn until game_over?
    conclusion
  end

  def create_players
    @player1 = create_player(1)
    @player2 = create_player(2)
  end

  def create_player(player_num)
    clear_screen
    puts display_player_name_request(player_num)
    player_name = player_name_input.capitalize

    puts
    puts display_player_color_request(player_name, @colors)
    player_color = player_color_input(@colors)
    @colors.delete(player_color)
    Player.new(player_name, player_color)
  end

  def create_cage
    clear_screen
    puts display_cage_size_request
    cage_size = cage_size_input.to_i
    @cage = Cage.new((cage_size))
  end

  def play_turn
    print_turn_request(@current_player.name, @current_player.color, @cage.min_col, @cage.max_col)
    column = player_turn_input(@cage.min_col, @cage.max_col)
    cage.update(@current_player.color, column)
    cage.display
    switch_current_player
  end

  def switch_current_player
    next_player = @current_player == @player1 ? @player2 : @player1
    @current_player = next_player
  end

  def game_over?
    cage.is_full? || cage.has_winner?
  end

  def conclusion
    if cage.is_full?
      puts display_cage_full_message
      print_spacer2
    elsif cage.has_winner?
    end
    sleep(3)
  end

  private

  def clear_screen
    system 'clear'
  end
end
