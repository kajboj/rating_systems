require_relative '../../lib/elo/player'

describe Elo::Player do
  subject do
    described_class.new(rating: 1613)
  end

  describe '#loses' do
    let(:other_player) { described_class.new(rating: 1609) }

    before do
      subject.loses(other_player)
    end

    its(:rating) { should be_within(0.5).of(1613 + 32 * (0-0.506)) }
  end

  describe '#wins' do
    let(:other_player) { described_class.new(rating: 1388) }

    before do
      subject.wins(other_player)
    end

    its(:rating) { should be_within(0.5).of(1613 + 32 * (1-0.785)) }
  end

  describe '#draws' do
    let(:other_player) { described_class.new(rating: 1477) }

    before do
      subject.draws(other_player)
    end

    its(:rating) { should be_within(0.5).of(1613 + 32 * (0.5-0.686)) }
  end
end
