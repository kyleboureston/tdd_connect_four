# frozen_string_literal: true

module Display
  # Mixin for all messages displayed to the user
  module Cage
    def print_top(final_col)
      puts '┌' + ('─' * ((final_col * 2) + 1)) + '┐'
    end

    def print_bottom(final_col)
      puts '└─' + ('┬─' * final_col) + '┘'
    end

    def print_spacer1
      puts
    end

    def print_spacer2
      2.times { puts }
    end

    def print_col_nums(final_col)
      print '  '
      [*1..final_col].each { |col| print "#{col} " }
    end

    def print_cells(cage)
      cage.each do |row|
        row.each_with_index { |circle, index| print_circle(circle, index, final_col) }
        print_spacer1
      end
    end

    def print_circle(circle, index, final_col)
      if index.zero?
        print '│ ' + color(circle) + ' '
      elsif index == (final_col - 1)
        print color(circle) + ' │'
      else
        print color(circle) + ' '
      end
    end

    def color(color = 'empty')
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
  end
end
