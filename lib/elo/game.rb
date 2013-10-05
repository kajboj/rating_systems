module Elo
  class Game
    def initialize player1, score1, player2, score2
    	@player1, @score1, @player2, @score2 = player1, score1, player2, score2
    end

    def process
      calculate_deltas
      update_ratings
    end

    def calculate_deltas
      self.rating_delta1 = player1.rating_delta(player2, score1)
      self.rating_delta2 = player2.rating_delta(player2, score2)
    end

    def update_ratings
      player1.rating += rating_delta1
      player2.rating += rating_delta2
    end

    private

    attr_reader :player1, :score1, :player2, :score2
    attr_accessor :rating_delta1, :rating_delta2
  end
end