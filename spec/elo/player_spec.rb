require_relative '../../lib/elo/player'

describe Elo::Player do
  subject do
    described_class.new(name: 'Bob', rating: 1613)
  end

  its(:name) { should == 'Bob' }
  its(:rating) { should == 1613 }

  describe '#rating_delta' do
    let(:other_player) { described_class.new(rating: 1609) }

    specify do
      delta = subject.rating_delta(other_player, 0)
      delta.should be_within(0.5).of(32 * (0-0.506))
    end
  end
end