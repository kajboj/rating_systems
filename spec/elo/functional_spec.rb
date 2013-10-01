require_relative '../../lib/elo/player'

describe 'example calculation from http://en.wikipedia.org/wiki/Elo_rating_system#Mathematical_details' do
  let(:players) do
    [
      Elo::Player.new(rating: 1609),
      Elo::Player.new(rating: 1477),
      Elo::Player.new(rating: 1388),
      Elo::Player.new(rating: 1586),
      Elo::Player.new(rating: 1720)
    ]
  end

  specify do
    players[0].draws(players[1])
    players[0].wins (players[2])
    players[0].wins (players[3])
    players[0].loses(players[4])

    player.rating.should == 1601
  end
end
