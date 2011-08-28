require_relative "dice"
class Player
  attr_reader :name, :score, :player_in_game, :turn_score
  def initialize(name)
    @name = name
    @score = 0
    @player_in_game = false
    @turn_score = 0
  end
  
  def play()
    dice = Dice.new(5)  
    while dice.number>0
      dice.roll()
      if dice.score == 0
        break
      else
        @turn_score += dice.score
      end            
    end
    update_score(@turn_score)
  end
  
  def update_score(points)
    if points >= 300 && !@player_in_game
      @player_in_game = true 
    end
    @score += points unless !@player_in_game
    return @score
  end  
end
