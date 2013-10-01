require_relative '../../lib/glicko/player'

describe Glicko::Player do
  subject do
    described_class.new(rating: 1500, rating_deviation: 200)
  end

  its(:rating)           { should == 1500 }
  its(:rating_deviation) { should == 200 }

  describe '#rating=' do
    before { subject.rating = 1234 }
    its(:rating) { should == 1234 }
  end

  describe '#rating_deviation=' do
    before { subject.rating = 321 }
    its(:rating) { should == 321 }
  end
end
