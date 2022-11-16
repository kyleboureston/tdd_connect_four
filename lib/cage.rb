# frozen_string_literal: true

# Class to create the cage/board to drop the pieces
class Cage
  attr_reader :cage, :blank_cell, :min_col, :max_col
  include Display::Cage

  def initialize(cage_size)
    @cage       = Array.new(cage_size) { Array.new(cage_size) { 'empty' } }
    @min_col    = 1
    @max_col    = cage_size
  end

  def display
    final_col = cage.length

    print_top(final_col)
    print_bottom(final_col)
    print_col_nums(final_col)
    print_spacer2
  end

  def update(player_color, col)
    @cage.reverse.map! do |row|
      row.map!.with_index do |cell, index|
        row_col = index + 1
        row_col == col && cell == 'empty' ? player_color : cell
      end
    end
  end
end
