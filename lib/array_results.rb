class ArrayResults
  include Enumerable
  
  def initialize results
    @results = results
  end

  def each &blk
    @results.each do |player1_name, player1_score, player2_name, player2_score|
      yield(
      	Time.parse('2013-10-04 13:43'),
      	player1_name,
      	player1_score,
      	player2_name,
      	player2_score
      )
    end
  end
end