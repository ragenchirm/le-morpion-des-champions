# Welcome to the ruby project : morpion-des-champions
require 'bundler'
Bundler.require
$LOAD_PATH << './lib'
require 'views/displayer'
require 'models/player'
require 'app/board'
require 'app/game'

game = Game.new
game.perform