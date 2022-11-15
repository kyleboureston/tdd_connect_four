# frozen_string_literal: true

require_relative 'display'

# Mixin for all inputs requested from user
module Input
  # Include the 'display' module to this module
  def self.-(_base)
    include Display
  end

  def player_name_input(player_num)
    player_name = gets.chomp
    return player_name if player_name.match(/^[A-Za-z]+$/)

    puts display_user_name_warning
    player_name_input(player_num)
  end

  def cage_size_input
    cage_size = gets.chomp
    return cage_size if cage_size.between?(5, 15)

    puts display_cage_size_warning
    cage_size_input
  end
end
