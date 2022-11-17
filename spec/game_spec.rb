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

  describe '#switch_current_player' do
    context 'when method is run' do
      subject(:original_player) { Player.new('original_player', 'red') } # (player_name, player_color)
      subject(:next_player) { Player.new('next_player', 'blue') }
      it 'changes the @current_player to the next player' do
        # Arrange
        game.player1 = original_player
        game.player2 = next_player
        game.current_player = original_player
        original_current_player = game.current_player
        # Act
        current_player = game.switch_current_player
        # Assert
        expect(original_current_player).not_to eq(current_player)
      end

      it '@current_player remains a Player class object' do
        # Arrange
        game.player1 = original_player
        game.player2 = next_player
        game.current_player = original_player
        original_current_player = game.current_player
        # Act
        current_player = game.switch_current_player
        # Assert
        expect(current_player.class).to eq(Player)
      end
    end
  end
end
