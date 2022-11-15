# frozen_string_literal: true

require_relative '../lib/game'
require_relative 'spec_helper'

describe Game do
  # NOTE: replace this with a double
  subject(:game) { described_class.new }
  # not used but good to have
  # let(:new_player) { double(Player, name: 'Hank', symbol: '1') } # if you call new_player.new it will create an object with that name and symbol

  describe '#create_player' do
    context 'when Player is created' do
      it 'sends message :new to Player with the correct arguments' do
        num = 1
        symbol = 'white'
        valid_name = 'Geo'
        allow(game).to receive(:player_name_input).and_return(valid_name)

        expect(Player).to receive(:new).with(valid_name, symbol)
        game.create_player(num, symbol)
      end
    end
  end
end
