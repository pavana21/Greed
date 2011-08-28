require '/Users/pavana/projects/greed/models/player.rb'
require '/Users/pavana/projects/greed/models/dice.rb'

describe Player do
  it "should initialize the correct values to player" do
    player = Player.new('Pavan')
    player.name.should eq('Pavan')
  end
  
  it "should not initialize the correct values to player" do
    player = Player.new("Teja")
    player.name.should_not eq('Pavan')
  end
  
  it "should has to check player is not in game" do
    player = Player.new('Pavan')
    player.player_in_game.should eq(false)
  end
  
  it "should players score be zero before starts palying " do
    player = Player.new('Pavan')
    player.score.should eq(0)
  end
  
  it "should turn_score be zero before playing" do
    player = Player.new('Pavan')
    player.turn_score.should eq(0)
  end
  
  it "should start playing and turn_score not equal to zero" do
    player = Player.new('Pavan')
    dice = Dice.new(5)
    player.play()
    dice.score == 0
    player.turn_score.should_not eq(0)
  end
  
  it "should player is in game" do
    player = Player.new('Pavan')
    player.update_score(350)
    player.player_in_game.should eq(true) 
    player.score.should_not eq(0)   
  end
  
end
