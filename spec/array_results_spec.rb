require_relative '../lib/array_results.rb'

describe ArrayResults do
  subject do
    described_class.new([
      ['player0', 0.5, 'player1', 0.5],
      ['player0',   1, 'player2',   0]
   ])
  end

  specify do
  	results = []

  	subject.each do |time, player1_name, score1, player_name2, score2|
  	  results << [time, player1_name, score1, player_name2, score2]
  	end

  	results.should == [
      [Time.new(2013, 10, 4, 13, 43), 'player0', 0.5, 'player1', 0.5],
	    [Time.new(2013, 10, 4, 13, 43), 'player0',   1, 'player2',   0]
  	]
  end
end