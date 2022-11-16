# frozen_string_literal: true

module Display
  # Mixin for all messages displayed to the user
  module Messages
    def display_player_name_request(player_num)
      "Player #{player_num}, what's your name?".bg_black
    end

    def display_player_name_warning
      'Try again. Please enter your name using letters only.'.bg_black
    end

    def display_cage_size_request
      'What size connect-four cage do you want to play with? Enter a number between 5 and 9.'.bg_black
    end

    def display_cage_size_warning
      'Try again. Please enter a number between 5 and 9.'.bg_black
    end

    def display_turn_request(player_name, min_col, max_col)
      "#{player_name} what column do you want to drop your piece? Select a column between #{min_col} and #{max_col}.".bg_black
    end

    def display_turn_warning(min_col, max_col)
      "Try again. Please enter a number between #{min_col} and #{max_col}.".bg_black
    end

    def display_player_color_request(player_name, colors)
      "Hi #{player_name}! What color do you want to be? Enter one of the following: #{colors.join(', ')}.".bg_black
    end

    def display_player_color_warning(colors)
      "Try again. Please enter one of the following: #{colors.join(', ')}.".bg_black
    end
  end
end
