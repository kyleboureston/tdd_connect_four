# frozen_string_literal: true

# Mixin for all messages displayed to the user
module Display
  def display_user_name_prompt(player_number)
    "Player #{player_number}, what's your name?"
  end

  def display_user_name_warning
    'Try again. Please enter your name using letters only.'
  end

  def display_cage_size_prompt
    'What size connect-four cage do you want to play with? Enter a number between 5 and 15.'
  end

  def display_cage_size_warning
    'Try again. Please enter a number between 5 and 15.'
  end
end
