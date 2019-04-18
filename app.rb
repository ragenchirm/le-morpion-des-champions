# Welcome to the ruby project : morpion-des-champions
require 'bundler'
Bundler.require
$LOAD_PATH << './lib'
require 'views/displayer'
require 'models/player'

tab = [[1, 2, 1], [1, 2, 1], [1, 2, 2]]
dis = Displayer.new
dis.display_grid
STDIN.getc
dis.display_grid(tab)
STDIN.getc
dis.display_grid
