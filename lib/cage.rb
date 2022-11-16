# frozen_string_literal: true

# Class to create the cage/board to drop the pieces
class Cage
  attr_reader :cage, :blank_cell, :min_col, :max_col

  def initialize(cage_size)
    @cage       = Array.new(cage_size) { Array.new(cage_size) { 'empty' } }
    @min_col    = 1
    @max_col    = cage_size
  end

  def display
    final_col = cage.length
    puts display_top(final_col)
    cage.each do |row|
      row.each_with_index { |circle, index| print_circle(circle, index, final_col) }
      print_spacer1
    end
    puts display_bottom(final_col)
    print_col_nums(final_col)
    print_spacer2
  end

  def update(player_token, col)
    counter = 0
    cage_arr = @cage.clone
    cage_arr.reverse.map! do |row|
      break if counter == 1

      row.map!.with_index do |cell, index|
        row_col = index + 1
        break if counter == 1

        if row_col == col && cell == 'empty'
          counter += 1
          player_token
        else
          cell
        end
      end
    end
  end

  private

  def print_col_nums(final_col)
    print '  '
    [*1..final_col].each { |col| print "#{col} " }
  end

  def print_circle(circle, index, final_col)
    if index.zero?
      print '│ ' + get_circle(circle) + ' '
    elsif index == (final_col - 1)
      print get_circle(circle) + ' │'
    else
      print get_circle(circle) + ' '
    end
  end

  def get_circle(color = 'empty')
    {
      'empty' => "\u25CB",
      'red' => "\u25CF".red,
      'blue' => "\u25CF".blue,
      'green' => "\u25CF".green,
      'yellow' => "\u25CF".yellow,
      'purple' => "\u25CF".purple,
      'pink' => "\u25CF".pink,
      'white' => "\u25CF".white
    }[color]
  end

  def display_top(final_col)
    '┌' + ('─' * ((final_col * 2) + 1)) + '┐'
  end

  def display_bottom(final_col)
    '└─' + ('┬─' * final_col) + '┘'
  end

  def print_spacer1
    puts
  end

  def print_spacer2
    2.times { puts }
  end
end
