# frozen_string_literal: true

require_relative 'colors'
require_relative 'display/messages'
require_relative 'display/cage'
require_relative 'input'
require_relative 'player'
require_relative 'cage'
require_relative 'game'

game = Game.new
game.play
