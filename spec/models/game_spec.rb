require '/Users/pavana/projects/greed/models/game.rb'
require '/Users/pavana/projects/greed/models/dice.rb'
require '/Users/pavana/projects/greed/models/player.rb'
describe Game do
  
  it "should start playing " do
    game = Game.new()
    pavan = Player.new('Pavan')
     #pavan.should_receive(:score).and_return(3175)
    teja = Player.new('Teja')
    sandy = Player.new('Sandy')
    @players = [pavan,teja,sandy]
    game.play_game(@players)
  end
end
