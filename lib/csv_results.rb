require 'csv'

class CsvResults
  def initialize filepath
    @filepath = filepath
  end

  def each &blk
    first = true
    CSV.foreach(@filepath) do |row|
      if first
        first = false
    else
      yield(
        time(row),
        player1_name(row),
        player1_score(row),
        player2_name(row),
        player2_score(row)
      )
    end
  end
end

  private

  def time(row)
    date_string = row[0]
    time_string = row[1]

    Time.parse([date_string, time_string].join(' '))
  end

  def player1_name(row)
    row[2]
  end

  def player2_name(row)
    row[3]
  end

  def player1_score(row)
    Integer(scores(row).first)
  end

  def player2_score(row)
    Integer(scores(row).last)
  end

  def scores(row)
    row[4].split('-')
  end
end