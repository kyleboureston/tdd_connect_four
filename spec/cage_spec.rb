# frozen_string_literal: true

require_relative '../lib/cage'
require_relative 'spec_helper'

describe Cage do
  cage_size = 5
  subject(:cage) { described_class.new(cage_size) }

  describe '#update' do
    context 'when color and column are sent to cage#update twice' do
      it 'adds that color, to that column of @cage twice' do
        # Arrange
        color = 'white'
        column = 1
        # Act
        2.times { cage.update(color, column) }
        count = 0
        cage.arr.each do |row|
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

  describe '#full?' do
    context 'when cage is full' do
      cage_size = 5
      player_color = 'red'
      red_arr = Array.new(cage_size) { Array.new(cage_size) { player_color } }
      subject(:full_cage) { described_class.new(cage_size, red_arr) }

      it 'returns true' do
        # Arrange
        # Act
        cage_is_full = full_cage.full?
        # Assert
        expect(cage_is_full).to be true
      end

      it "@conclusion is updated to 'board_full'" do
        # Arrange
        # Act
        full_cage.full?
        # Assert
        expect(full_cage.conclusion).to eq('board_full')
      end
    end

    context 'when cage is NOT full' do
      cage_size = 5
      subject(:not_full_cage) { described_class.new(cage_size) }

      it 'returns false' do
        # Arrange
        # Act
        cage_is_not_full = not_full_cage.full?
        # Assert
        expect(cage_is_not_full).to be false
      end

      it "@conclusion is not changed'" do
        # Arrange
        original_conclusion = not_full_cage.instance_variable_get(:@guess_count)
        # Act
        not_full_cage.full?
        # Assert
        expect(not_full_cage.conclusion).to eq(original_conclusion)
      end
    end
  end
end
