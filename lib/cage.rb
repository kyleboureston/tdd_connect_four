# frozen_string_literal: true

# Class to create the cage/board to drop the pieces
class Cage
  attr_reader :cage

  def initialize(cage_size)
    @cage = Array.new(cage_size) { Array.new(cage_size) { "\u25EF" } }
  end

  def display
    final = cage.length
    puts display_top(final)
    cage.each do |row|
      row.each_with_index { |cell, index| print_cell(cell, index, final) }
      puts display_blank_line
    end
    puts display_bottom(final)
  end

  def update(col)

  end

  private

  def print_cell(cell, index, final)
    if index.zero?
      print "│ #{cell} "
    elsif index == (final - 1)
      print "#{cell} │"
    else
      print "#{cell} "
    end
  end

  def display_top(final)
    '┌' + ('─' * ((final * 2)+ 1)) + '┐'
  end

  def display_bottom(final)
    '└' + ('─' * ((final * 2)+ 1)) + '┘'
  end

  def display_blank_line; end
end
