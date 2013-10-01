module Glicko
  class Player
    attr_accessor :rating, :rating_deviation

    def initialize(args)
      @rating           = args[:rating]
      @rating_deviation = args[:rating_deviation]
    end
  end
end
