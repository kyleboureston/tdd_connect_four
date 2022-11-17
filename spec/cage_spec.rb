# frozen_string_literal: true

require_relative '../lib/cage'
require_relative 'spec_helper'

describe Cage do
  cage_size = 5
  subject(:game) { described_class.new(cage_size) }

  describe '#update' do
    cage_size = 6
    subject(:new_cage) { Cage.new(cage_size) }
    context 'when color and column are sent to to cage#update twice' do
      it 'adds that color, to that column of @cage twice' do
        # Arrange
        color = 'white'
        column = 1
        # Act
        new_cage.update(color, column)
        new_cage.update(color, column)

        count = 0
        new_cage.cage.each do |row|
          row.each_with_index do |cell_color, index|
            col_index = index + 1
            count += 1 if col_index == column && cell_color == color
          end
        end
        # Assert
        expect(count).to be(2)
      end
    end
  end
end
