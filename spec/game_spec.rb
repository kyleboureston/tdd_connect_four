# frozen_string_literal: true

require_relative '../lib/game'
require_relative 'spec_helper'

describe Game do
  subject(:game) { described_class.new }
  # not used but good to have
  # let(:new_player) { double(Player, name: 'Hank', symbol: '1') } # if you call new_player.new it will create an object with that name and symbol

  describe '#create_player' do
    context 'when Player.new is called' do
      it 'sends message :new to Player with the correct arguments' do
        # Arrange
        num = 1

        valid_name = 'Geo'
        allow(game).to receive(:clear_screen)
        allow(game).to receive(:puts)
        allow(game).to receive(:player_name_input).and_return(valid_name)

        valid_color = 'white'
        allow(game).to receive(:clear_screen)
        allow(game).to receive(:puts)
        allow(game).to receive(:player_color_input).and_return(valid_color)
        # Assert
        expect(Player).to receive(:new).with(valid_name, valid_color)
        # Act
        game.create_player(num)
      end
    end
  end

  describe '#create_cage' do
    context 'when Cage.new is called' do
      it 'sends message :new to Cage with the correct arguments' do
        # Arrange
        valid_cage_size = 5
        allow(game).to receive(:clear_screen)
        allow(game).to receive(:puts)
        allow(game).to receive(:cage_size_input).and_return(valid_cage_size)
        # Assert
        expect(Cage).to receive(:new).with(valid_cage_size)
        # Act
        game.create_cage
      end
    end
  end
end
