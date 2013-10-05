require_relative '../../lib/players'
require_relative '../../lib/array_results'
require_relative '../../lib/elo/elo'
require_relative '../../lib/elo/player'

describe 'example calculation from http://en.wikipedia.org/wiki/Elo_rating_system#Mathematical_details' do
  let(:players) do
    Players.new(
      Elo::Player,
      [
        Elo::Player.new(name: 'player0', rating: 1613),
        Elo::Player.new(name: 'player1', rating: 1609),
        Elo::Player.new(name: 'player2', rating: 1477),
        Elo::Player.new(name: 'player3', rating: 1388),
        Elo::Player.new(name: 'player4', rating: 1586),
        Elo::Player.new(name: 'player5', rating: 1720)
      ]
    )
  end

  let(:results) do
    ArrayResults.new([
      ['player0',   0, 'player1',   1],
      ['player0', 0.5, 'player2', 0.5],
      ['player0',   1, 'player3',   0],
      ['player0',   1, 'player4',   0],
      ['player0',   0, 'player5',   1]
    ])
  end

  specify do
    games = Elo.games(results, players)
    games.each(&:calculate_deltas)
    games.each(&:update_ratings)

    player = players.find_or_create('player0')

    player.rating.should be_within(0.5).of(1601)
  end
end