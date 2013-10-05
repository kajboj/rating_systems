require_relative '../lib/csv_results.rb'

describe CsvResults do
  subject do
    described_class.new('./spec/test_results.csv')
  end

  specify do
  	results = []

  	subject.each do |time, player1_name, score1, player_name2, score2|
  	  results << [time, player1_name, score1, player_name2, score2]
  	end

  	results.should == [
	    [Time.new(2013, 9, 30, 19, 40), 'Jack',   21, 'Phyo', 8],
	    [Time.new(2012, 7, 21, 17, 10), 'Fraser', 11, 'Phil', 6]
  	]
  end
end