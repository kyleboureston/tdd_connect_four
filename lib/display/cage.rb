# frozen_string_literal: true

module Display
  # Mixin for all messages displayed to the user
  module Cage
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

    def print_col_nums(final_col)
      print '  '
      [*1..final_col].each { |col| print "#{col} " }
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
