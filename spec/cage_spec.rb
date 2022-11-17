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

      it "@conclusion is changed to 'board_full'" do
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
        original_conclusion = not_full_cage.instance_variable_get(:@conclusion)
        # Act
        not_full_cage.full?
        # Assert
        expect(not_full_cage.conclusion).to eq(original_conclusion)
      end
    end
  end

  player_name = 'Mr Player'
  player_color = 'red'
  subject(:dummy_player) { Player.new(player_name, player_color) }

  describe '#winner?' do
    describe 'when there is a NO winner' do
      # NOTE: if you have a winning col or a winning diagonal, that will skew the test
      cage_size = 5
      arr = [['red', ''   , '', '', ''   ],
              ['red', ''   , '', '', ''   ],
              [''   , 'red', '', '', 'red'],
              [''   , 'red', '', '', ''   ],
              [''   , ''   , '', '', 'red']
            ]
      subject(:cage_no_winning_col) { Cage.new(cage_size, arr) }

      it 'returns false' do
        # Arrange
        # Act
        cage_has_no_winning_col = cage_no_winning_col.winner?(dummy_player)
        # Assert
        expect(cage_has_no_winning_col).to be false
      end

      it '@conclusion is not changed' do
        # Arrange
        original_conclusion = cage_no_winning_col.instance_variable_get(:@conclusion)
        # Act
        cage_no_winning_col.winner?(dummy_player)
        # Assert
        expect(cage_no_winning_col.conclusion).to eq(original_conclusion)
      end
    end

    # NOTE: if you have a winning col or diagonal, that will skew the test
    describe 'when there is a winner' do
      context 'and it is a winning row' do
        cage_size = 5
        arr = [['red', ''   , ''   , ''   , ''   ],
               ['red', ''   , ''   , ''   , ''   ],
               [''   , 'red', 'red', 'red', 'red'], # this is the winning row for red
               [''   , 'red', ''   , ''   , ''   ],
               [''   , ''   , ''   , ''   , 'red']
              ]
        subject(:cage_winning_row) { Cage.new(cage_size, arr) }

        it 'returns true' do
          # Arrange
          # Act
          cage_has_winning_row = cage_winning_row.winner?(dummy_player)
          # Assert
          expect(cage_has_winning_row).to be true
        end

        it '@conclusion is changed to a Player class object' do
          # Arrange
          # Act
          cage_winning_row.winner?(dummy_player)
          # Assert
          expect(cage_winning_row.conclusion.class).to eq(Player)
        end
      end

      # NOTE: if you have a winning col or diagonol, that will skew the test
      context 'and it is a winning column' do
        cage_size = 5
        arr = [['red', '', ''   , '', ''   ],
               ['red', '', ''   , '', ''   ],
               ['red', '', 'red', '', 'red'],
               ['red', '', ''   , '', ''   ],
               [''   , '', ''   , '', 'red']
              ]
        subject(:cage_winning_col) { Cage.new(cage_size, arr) }

        it 'returns true' do
          # Arrange
          # Act
          cage_has_winning_row = cage_winning_col.winner?(dummy_player)
          # Assert
          expect(cage_has_winning_row).to be true
        end

        it '@conclusion is changed to a Player class object' do
          # Arrange
          # Act
          cage_winning_col.winner?(dummy_player)
          # Assert
          expect(cage_winning_col.conclusion.class).to eq(Player)
        end
      end

    # NOTE: if you have a winning row or col, that will skew the test
      context 'and it is a winning diagonol' do
        cage_size = 5
        arr = [['red', ''   , ''   , ''   , ''   ],
               [''   , 'red', ''   , ''   , ''   ],
               [''   , ''   , 'red', ''   , 'red'],
               ['red', ''   , ''   , 'red', ''   ],
               [''   , ''   , ''   , ''   , ''   ]
              ]
        subject(:cage_winning_diagonol) { Cage.new(cage_size, arr) }

        it 'returns true' do
          # Arrange
          # Act
          cage_has_winning_diagonol = cage_winning_diagonol.winner?(dummy_player)
          # Assert
          expect(cage_has_winning_diagonol).to be true
        end

        it '@conclusion is changed to a Player class object' do
          # Arrange
          # Act
          cage_winning_diagonol.winner?(dummy_player)
          # Assert
          expect(cage_winning_diagonol.conclusion.class).to eq(Player)
        end
      end
    end
  end
end
