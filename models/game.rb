require_relative "dice"
require_relative "player"
class Game
 attr_reader :players

  def initialize()
    @players = nil
  end

  def play_game(players)
    if players == nil || players.length < 2
      raise(ArgumentError, "Two or more players are required to play the game!") 
    end
    @players = players
    while !is_final_round?
      give_all_players_a_turn_unless {is_final_round?}
    end
    leading_player = player_has_winning_score?
    give_all_players_a_turn_unless {|player| player == leading_player}
  end

  def give_all_players_a_turn_unless ()
   @players.each {|player| player.play() }
  end

  def is_final_round?
    player_has_winning_score? != nil
  end

  def player_has_winning_score?
    players = @players.select {|player| player.score >= 3000}
    players.length > 0 ? players[0] : nil
  end
end
