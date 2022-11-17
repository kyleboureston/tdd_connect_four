# frozen_string_literal: true

require_relative 'display/cage'

# Class to create the cage/board to drop the pieces
class Cage
  include Display::Cage
  attr_reader :cage, :blank_cell, :min_col, :max_col, :conclusion

  def initialize(cage_size)
    @cage       = Array.new(cage_size) { Array.new(cage_size) { 'empty' } }
    @min_col    = 1
    @max_col    = cage_size
    @conclusion = nil
  end

  def display
    clear_screen
    final_col = cage.length

    print_top(final_col)
    print_circles(@cage, final_col)
    print_bottom(final_col)
    print_col_nums(final_col)
    print_spacer2
  end

  def update(player_color, col, arr = @cage.reverse)
    counter = 0
    arr.map! do |row|
      break if counter == 1

      row.map!.with_index do |cell, index|
        break if counter == 1

        row_col = index + 1
        if row_col == col && cell == 'empty'
          counter += 1
          player_color
        else
          cell
        end
      end
    end
  end

  def full?
    total_blank_cells = @cage.flatten.count('empty')
    if total_blank_cells.zero?
      @conclusion = 'board_full'
      true
    else
      false
    end
  end

  def winner?(player)
    if row_winner?(player.color) || col_winner?(player.color) || diagonal_winner?(player.color)
      @conclusion = player
      true
    else
      false
    end
  end

  private

  def row_winner?(player_color, arr = @cage.reverse)
    count = 0
    arr.each do |row|
      break if count == 4

      row.each do |cell_color|
        cell_color == player_color ? count += 1 : count = 0
        break if count == 4
      end
    end

    count == 4
  end

  def col_winner?(player_color, arr = @cage.reverse)
    cols_as_rows = convert_cols_to_rows(arr)
    row_winner?(player_color, cols_as_rows)
  end

  def convert_cols_to_rows(arr)
    response = Array.new(arr[0].length) { [] }
    arr.each do |row|
      row.each.with_index do |value, index|
        response[index] << value
      end
    end
    response
  end

  def diagonal_winner?(player_color, arr = @cage.reverse)
    response = false
    coordinates = coordinates_of_players_color(player_color, arr)
    return if coordinates.length <= 3

    coordinates.each do |coordinate|
      break if response == true

      # Counting always starts from the bottom and counts up (to the right or left), so you
      # only need to count in one direction.
      diagonal_right_winner = check_path_right(player_color, coordinate, arr, @max_col)
      diagonal_left_winner = check_path_left(player_color, coordinate, arr, @max_col)

      response = true if diagonal_right_winner == true || diagonal_left_winner == true
    end
    response
  end

  def coordinates_of_players_color(player_color, arr)
    response = []
    arr.each.with_index do |row, row_index|
      row.each.with_index do |cell_color, cell_index|
        response.push([row_index, cell_index]) if cell_color == player_color
      end
    end
    response
  end

  def check_path_right(player_color, coordinate, arr, max_col, counter = 1)
    return true if counter == 4

    x, y = coordinate
    up_right = [x + 1, y + 1] if (x + 1).between?(0, max_col - 1) && (y + 1).between?(0, max_col - 1)
    return false if up_right.nil? || player_color != coordinate_color(up_right, arr)

    check_path_right(player_color, up_right, arr, max_col, counter + 1)
  end

  def check_path_left(player_color, coordinate, arr, max_col, counter = 1)
    return true if counter == 4

    x, y = coordinate
    up_left = [x + 1, y - 1] if (x + 1).between?(0, max_col - 1) && (y - 1).between?(0, max_col - 1)
    return false if up_left.nil? || player_color != coordinate_color(up_left, arr)

    check_path_left(player_color, up_left, arr, max_col, counter + 1)
  end

  def coordinate_color(coordinate, arr)
    x, y = coordinate
    arr[x][y]
  end

  def clear_screen
    system 'clear'
  end
end
