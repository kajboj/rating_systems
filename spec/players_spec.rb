require_relative '../lib/players'

describe Players do
  subject do
    described_class.new(TestPlayer, [bob, dave])
  end

  let(:bob)  { double('bob',  name: 'Bob') }
  let(:dave) { double('dave', name: 'Dave') }

  describe '#find_or_create' do
    it 'finds player by name' do
      subject.find_or_create('Bob').should == bob
      subject.find_or_create('Dave').should == dave
    end

    it 'creates new player if name does not exist' do
      jenny = subject.find_or_create('Jenny')
      jenny.name.should == 'Jenny'
      jenny.class.should == TestPlayer
    end
  end
  
  class TestPlayer
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end
end