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
        error_message = 'Try again. Please enter your name using letters only.'
        # Assert
        expect(dummy).to receive(:puts).with(error_message).once
        # Act
        dummy.player_name_input(player_num)
      end
    end
  end

  describe '#cage_size_input' do
    describe 'when user input is a number between 5 and 15' do
      it 'returns the number' do
        # Arrange
        valid_number = 6
        allow(dummy).to receive(:gets).and_return(valid_number)
        # Act
        valid_input = dummy.cage_size_input
        # Assert
        expect(valid_input).to eq(valid_number)
      end
    end

    describe 'when user inputs two incorrect value, then a valid input' do
      it 'return the number and display error message twice' do
        # Arrange
        valid_number = 6
        low_number = 1
        high_number = 200
        allow(dummy).to receive(:gets).and_return(low_number, high_number, valid_number)
        error_message = 'Try again. Please enter a number between 5 and 9.'
        # Assert
        expect(dummy).to receive(:puts).with(error_message).twice
        # Act
        dummy.cage_size_input
      end
    end
  end
end
