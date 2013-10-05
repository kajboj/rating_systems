module Elo
  class Player
    attr_accessor :rating
    attr_reader :name

    K = 32

    def initialize(attrs)
      @name   = attrs[:name]
      @rating = attrs[:rating]
    end

    def rating_delta(other_player, actual_score)
      expected_score = expected_score_against(other_player)

      (K * (actual_score - expected_score))
    end

    private

    def expected_score_against(other_player)
      (1/(1 + 10**((other_player.rating - rating).to_f/400)))
    end
  end
end