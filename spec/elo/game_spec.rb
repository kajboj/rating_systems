require_relative '../../lib/elo/game'
require_relative '../../lib/elo/player'

describe Elo::Game do
  subject do
    described_class.new(
      player1, player1_score,
      player2, player2_score
    )
  end

  let(:player1) { Elo::Player.new(rating: 1613) }
  let(:player2) { Elo::Player.new(rating: 1609) }
  let(:player1_score) { 0 }
  let(:player2_score) { 1 }

  before do
    subject.process
  end

  describe '#process' do
    let(:rating_delta) { 32 * (0-0.506) }

    it 'updates rating of player1' do
      player1.rating.should be_within(0.5).of(1613 + rating_delta)
    end

    it 'updates rating of player2' do
      player2.rating.should be_within(0.5).of(1609 - rating_delta)
    end
  end
end