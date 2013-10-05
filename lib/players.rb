class Players
  def initialize player_class, players = []
  	@player_class = player_class
  	@players = players
  end

  def find_or_create name
  	player = find(name)
  	return player if player

  	player = @player_class.new(name)
  	@players << player
  	player
  end

  private

  def find name
  	@players.find do |player|
  	  player.name == name
  	end
  end
end