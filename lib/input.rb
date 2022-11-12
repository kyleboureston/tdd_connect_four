# frozen_string_literal: true

# Mixin for all inputs requested from user
module Inputs
  def player_name_input(player_num)
    puts display_user_name_prompt(player_num)
    player_name = gets.chomp
    return player_name.capitalize if player_name.match(/[A-Za-z]/)

    puts display_user_name_warning
    player_name_input(player_num)
  end
end