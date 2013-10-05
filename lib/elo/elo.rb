require_relative 'game'

module Elo
  def self.games(results, players)
  	results.map do |time, player1_name, player1_score, player2_name, player2_score|
  	  player1 = players.find_or_create(player1_name)
  	  player2 = players.find_or_create(player2_name)

  	  Elo::Game.new(player1, player2_score, player2, player2_score)
  	end
  end
end