# frozen_string_literal: true

require_relative 'display/messages'

# Mixin for all inputs requested from user
module Input
  # Include the 'display' module to this module
  def self.-(_base)
    include Display::Messages
  end

  def player_name_input
    name_input = gets.chomp
    return name_input if name_input.match(/^[A-Za-z]+$/)

    puts display_player_name_warning
    player_name_input
  end

  def player_color_input(colors)
    player_color = gets.chomp
    return player_color.downcase if colors.include?(player_color.downcase)

    puts display_player_color_warning(colors)
    player_color_input(colors)
  end

  def cage_size_input
    size_input = gets.to_i
    return size_input if size_input.between?(5, 9)

    puts display_cage_size_warning
    cage_size_input
  end

  def player_turn_input(min_col, max_col)
    column_input = gets.to_i
    return column_input if column_input.between?(min_col, max_col)

    puts display_turn_warning(min_col, max_col)
    player_turn_input(min_col, max_col)
  end
end
