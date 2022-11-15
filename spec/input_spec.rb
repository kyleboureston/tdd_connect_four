# frozen_string_literal: true

require_relative '../lib/input'
require_relative 'spec_helper'

# Help with rspec and modules: https://mixandgo.com/learn/ruby/module-testing-with-rspec
describe Input do
  let(:dummy) { Class.new { extend Input, Display } }

  describe '#player_name_input' do
    describe 'when user inputs valid_name' do
      it 'returns player_name' do
        # Arrange
        player_num = 1
        valid_name = 'geo'
        allow(dummy).to receive(:puts)
        allow(dummy).to receive(:gets).and_return(valid_name)
        # Act
        player_name = dummy.player_name_input(player_num)
        # Assert
        expect(player_name).to eq(valid_name)
      end
    end

    describe 'when user inputs invalid_name once, then valid_name' do
      it 'displays error message, requests new input, then returns valid name' do
        # Arrange
        player_num = 1
        invalid_name = '1ste1'
        valid_name = 'Geo'

        allow(dummy).to receive(:puts)
        allow(dummy).to receive(:gets).and_return(invalid_name, valid_name)
        # Assert
        expect(dummy).to receive(:puts).once
        # Act
        dummy.player_name_input(player_num)
      end
    end
  end
end
