# frozen_string_literal: true

# Mixin for all inputs requested from user
module Input
  # Include the 'display' module to this module
  def self.-(_base)
    include Display
  end

  def player_name_input(player_num)
    puts display_user_name_prompt(player_num)
    player_name = gets.chomp
    return player_name.capitalize if player_name.match(/[A-Za-z]/)

    puts display_user_name_warning
    player_name_input(player_num)
  end

  def cage_size_input
    puts display_cage_size_prompt
    cage_size = gets.chomp.to_i
    return cage_size.to_i if cage_size.between?(5, 15)

    puts display_cage_size_warning
    cage_size_input
  end
end
