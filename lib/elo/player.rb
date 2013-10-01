module Elo
  class Player
    attr_reader :rating

    K = 32

    def initialize(attrs)
      @rating = attrs[:rating]
    end

    def loses(other_player)
      game(other_player, 0)
    end

    def wins(other_player)
      game(other_player, 1)
    end

    def draws(other_player)
      game(other_player, 0.5)
    end

    def game(other_player, actual_score)
      expected_score = expected_score_against(other_player)

      self.rating = (rating + K * (actual_score - expected_score))
    end

    private

    def expected_score_against(other_player)
      (1/(1 + 10**((other_player.rating - rating).to_f/400)))
    end

    attr_writer :rating
  end
end
