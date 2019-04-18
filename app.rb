# Welcome to the ruby project : morpion-des-champions
require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'views/displayer'
require 'models/player'

tab=[[1,2,1],[1,2,1],[1,2,2]]
dis = Displayer.new
dis.display_grid
STDIN.getc
dis.display_grid(tab)
STDIN.getc
dis.display_grid

player = Player.new
p "#{player.name} a pour symbole #{player.symbol}"
