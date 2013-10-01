describe 'example calculation from http://www.glicko.net/glicko/glicko.pdf' do
  let(:players) do
    [
      Glicko::Player.new(rating: 1500, rating_deviation: 200),
      Glicko::Player.new(rating: 1400, rating_deviation:  30),
      Glicko::Player.new(rating: 1550, rating_deviation: 100),
      Glicko::Player.new(rating: 1700, rating_deviation: 300)
    ]
  end

  let(:games) do
    [
      Game.new(winner: player[0], loser: player[1]),
      Game.new(winner: player[2], loser: player[0]),
      Game.new(winner: player[3], loser: player[0])
    ]
  end

  specify '#rating' do
    player[0].process(games)

    player[0].rating.should == 1464
    player[0].rating_deviation.should == 151.4
  end
end
